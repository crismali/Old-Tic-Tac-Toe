module VictoryChecks

  include './get_lines'

  def cats_game?
    @board_array.uniq.size == 2 && @who_won == false
  end

  def did_anyone_win?

    @who_won = diagonal_win?
    @who_won = horizontal_win? unless @who_won
    @who_won = vertical_win? unless @who_won

  end

  def diagonal_win?

    diagonal_1, diagonal_2 = get_diagonals(@board_array)

    return return_first_if_all_same_elements(diagonal_1, diagonal_2)


  end

  def horizontal_win?

    row_1, row_2, row_3 = get_rows(@board_array)

    return return_first_if_all_same_elements(row_1, row_2, row_3)

  end

  def vertical_win?

    column_1, column_2, column_3 = get_columns(@board_array)

    return return_first_if_all_same_elements(column_1, column_2, column_3)

  end

  def all_same_elements?(array)
    array.uniq.size == 1
  end

  def return_first_if_all_same_elements(*lines)

    if all_same_elements?(lines[1])
      return lines[1].first
    elsif all_same_elements?(lines[2])
      return lines[2].first
    elsif lines[3].present? && all_same_elements?(lines[3])
      return lines[3].first
    else
      return false
    end

  end


end
