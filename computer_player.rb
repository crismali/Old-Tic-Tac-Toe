class ComputerPlayer

  include GetLines

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

    return cpu_choice - 1

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

    line.delete_if { |element| element.is_a? String}

    line << false if line.empty?

    return line

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
    space = false

    if board_array.uniq.size == 9 || board_array.uniq.size == 8
      space = corner_if_available(space)
    elsif board_array.uniq.size <= 7
      space = 4 if board_array.include? 5
      space = corner_if_available(space) unless space
      space = any_spaces_available?(board_array).sample unless space
    end

    return space

  end

  def corner_if_available(space)
    space = 0 if board_array.include? 1
    space = 2 if board_array.include? 3
    space = 6 if board_array.include? 7
    space = 8 if board_array.include? 9

    return space

  end

end
