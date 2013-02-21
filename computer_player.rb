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

    cpu_choice = complete_for_win?(get_diagonals(board_array), get_rows(board_array), get_columns(board_array))

    cpu_choice = block_opponent?(board_array) unless cpu_choice

    cpu_choice = stop_corner_strategy?(board_array) unless cpu_choice

    cpu_choice = play_strategy(board_array) unless cpu_choice

    return cpu_choice

  end

  def block_opponent?(board_array)

    cpu_choice = false

    cpu_choice = if_should_block_logic(get_diagonals(board_array))
    cpu_choice = if_should_block_logic(get_rows(board_array)) unless cpu_choice
    cpu_choice = if_should_block_logic(get_columns(board_array)) unless cpu_choice

    return cpu_choice

  end

  def if_should_block_logic(*lines)

    available_in_line_1 = any_spaces_available?(lines[1]).first
    available_in_line_2 = any_spaces_available?(lines[2]).first
    available_in_line_3 = any_spaces_available?(lines[3]).first

    if section_should_be_blocked?(lines[1]) && available_in_line_1
      return available_in_line_1
    elsif section_should_be_blocked?(lines[2]) && available_in_line_2
      return available_in_line_2
    elsif lines[3].present? && section_should_be_blocked?(lines[3]) && available_in_line_3
      return available_in_line_3
    else
      return false
    end

  end

  def section_should_be_blocked?(array)
    array.uniq.size == 2
  end

  def complete_for_win?(*array_of_lines)

    array_of_lines.flatten(1).each do |line|

      if section_should_be_blocked?(line)

        if line.uniq[0].is_a? Integer && line.uniq[1] == 'O'
          return any_spaces_available?(line)
        elsif line.uniq[1].is_a? Integer && line.uniq[0] == 'O'
          return any_spaces_available?(line)
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



  end

  def play_strategy(board_array)

    board_array.uniq.select! { |element| element.is_a? Integer}
    board_array.include? 4

  end

end
