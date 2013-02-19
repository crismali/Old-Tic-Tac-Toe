class ComputerPlayer

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
    diagonal_1 = board_array.values_at(0,4,8)
    diagonal_2 = board_array.values_at(2,4,6)

    if section_should_be_blocked?(diagonal_1) && any_spaces_available?(diagonal_1).first
      return any_spaces_available?(diagonal_1).first
    elsif section_should_be_blocked?(diagonal_2) && any_spaces_available?(diagonal_2).first
      return any_spaces_available?(diagonal_2).first
    else
      return false
    end

  end

  def horizontal_block?(board_array)
    row_1 = board_array.take(3)
    row_2 = board_array.values_at(3,4,5)
    row_3 = board_array.values_at(6,7,8)

    if section_should_be_blocked?(row_1) && any_spaces_available?(row_1).first
      return any_spaces_available?(row_1).first
    elsif section_should_be_blocked?(row_2) && any_spaces_available?(row_2).first
      return any_spaces_available?(row_2).first
    elsif section_should_be_blocked?(row_3) && any_spaces_available?(row_3).first
      return any_spaces_available?(row_3).first
    else
      return false
    end

  end

  def vertical_block?(board_array)
    column_1 = board_array.values_at(0,3,6)
    column_2 = board_array.values_at(1,4,7)
    column_3 = board_array.values_at(2,5,8)

    if section_should_be_blocked?(column_1) && any_spaces_available?(column_1).first
      return any_spaces_available?(column_1).first
    elsif section_should_be_blocked?(column_2) && any_spaces_available?(column_2).first
      return any_spaces_available?(column_2).first
    elsif section_should_be_blocked?(column_3) && any_spaces_available?(column_3).first
      return any_spaces_available?(column_3).first
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

    if available_spaces.empty?
      available_spaces << false
      return available_spaces
    else
      return available_spaces
    end

  end

  def play_strategy(board_array)

  end

end
