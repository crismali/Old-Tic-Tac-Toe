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

    if all_same_elements?(diagonal_1)
      return diagonal_1.first
    elsif all_same_elements?(diagonal_2)
      return diagonal_2.first
    else
      return false
    end

  end

  def horizontal_win?

    row_1, row_2, row_3 = get_rows(@board_array)

    if all_same_elements?(row_1)
      return row_1.first
    elsif all_same_elements?(row_2)
      return row_2.first
    elsif all_same_elements?(row_3)
      return row_3.first
    else
      return false
    end

  end

  def vertical_win?

    column_1, column_2, column_3 = get_columns(@board_array)

    if all_same_elements?(column_1)
      return column_1.first
    elsif all_same_elements?(column_2)
      return column_2.first
    elsif all_same_elements?(column_3)
      return column_3.first
    else
      return false
    end

  end

  def all_same_elements?(array)
    array.uniq.size == 1
  end


end
