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

    cpu_choice = block_opponent?(board_array)

    cpu_choice = play_strategy(board_array) unless cpu_choice

    return cpu_choice

  end

  def block_opponent?(board_array)

    cpu_choice = false

    cpu_choice = diagonal_block?(board_array)
    cpu_choice = horizontal_block?(board_array) unless cpu_choice
    cpu_choice = vertical_block?(board_array) unless cpu_choice

    return cpu_choice

  end

  def diagonal_block?(board_array)

    diagonal_1, diagonal_2 = get_diagonals(board_array)

    return if_should_block_logic(diagonal_1, diagonal_2)

  end

  def horizontal_block?(board_array)

    row_1, row_2, row_3 = get_rows(board_array)

    return if_should_block_logic(row_1, row_2, row_3)

  end

  def vertical_block?(board_array)

    column_1, column_2, column_3 = get_columns(board_array)

    return if_should_block_logic(column_1, column_2, column_3)

  end

  def if_should_block_logic(*lines)

    if section_should_be_blocked?(lines[1]) && any_spaces_available?(lines[1]).first
      return any_spaces_available?(lines[1]).first
    elsif section_should_be_blocked?(lines[2]) && any_spaces_available?(lines[2]).first
      return any_spaces_available?(lines[2]).first
    elsif lines[3].present? && section_should_be_blocked?(lines[3]) && any_spaces_available?(lines[3]).first
      return any_spaces_available?(lines[3]).first
    else
      return false
    end

  end

  def section_should_be_blocked?(array)
    array.uniq.size == 2
  end

  def any_spaces_available?(array)

    available_spaces = Array.new

    array.each do |space|
        available_spaces << array.index(space) if space.is_a? Integer
    end

    available_spaces << false if available_spaces.empty?

    return available_spaces

  end

  def play_strategy(board_array)

    board_array.uniq.select! { |element| element.is_a? Integer}

  end

end
