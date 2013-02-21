class ComputerPlayer

  include './get_lines'

  def mark_the_board(board_array, which_player)

    which_player = 'O'

    cpu_choice = cpu_decides_which_space(board_array)

    board_array[cpu_choice] = which_player

    return board_array

  end

  def cpu_decides_which_space(board_array)

    cpu_choice = false

    cpu_choice = complete_for_win?(get_lines(board_array))

    cpu_choice = stop_corner_strategy?(board_array) unless cpu_choice

    cpu_choice = block_opponent?(get_lines(board_array)) unless cpu_choice

    cpu_choice = play_strategy(board_array) unless cpu_choice

    return cpu_choice

  end

  def block_opponent?(*array_of_lines)

    array_of_lines.flatten(1).each do |line|

      available_space = any_spaces_available?(line).first

      if section_should_be_blocked?(line) && available_space
        return available_space
      end

    end

    return false

  end

  def section_should_be_blocked?(array)
    array.uniq.size == 2
  end

  def complete_for_win?(*array_of_lines)

    array_of_lines.flatten(1).each do |line|

      if section_should_be_blocked?(line)

        if line.uniq[0].is_a? Integer && line.uniq[1] == 'O'
          return any_spaces_available?(line).first
        elsif line.uniq[1].is_a? Integer && line.uniq[0] == 'O'
          return any_spaces_available?(line).first
        end

      end

    end

    return false

  end


  def any_spaces_available?(line)

    available_spaces = Array.new

    line.each do |space|
        available_spaces << line.index(space) if space.is_a? Integer
    end

    available_spaces << false if available_spaces.empty?

    return available_spaces

  end

  def stop_corner_strategy?(board_array)

    diagonals = Array.new
    diagonals = get_diagonals(board_array)

    space = false

    diagonals.each do |diagonal|

      if section_should_be_blocked?(diagonal)
        if diagonal.first == 'X' && diagonal.last == 'X'
          space = 1 if board_array.include? 2
          space = 3 if board_array.include? 4
          space = 5 if board_array.include? 6
          space = 7 if board_array.include? 8
        end
      end
    end
    return space
  end

  def play_strategy(board_array)

    board_array.uniq.select! { |element| element.is_a? Integer}
    board_array.include? 4

  end

end
