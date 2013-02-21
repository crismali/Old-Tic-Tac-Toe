module GetLines

  def get_diagonals(board_array)

    diagonal_1 = board_array.values_at(0,4,8)
    diagonal_2 = board_array.values_at(2,4,6)

    return diagonal_1, diagonal_2

  end

  def get_rows(board_array)

    row_1 = board_array.take(3)
    row_2 = board_array.values_at(3,4,5)
    row_3 = board_array.values_at(6,7,8)

    return row_1, row_2, row_3

  end

  def get_columns(board_array)

    column_1 = @board_array.values_at(0,3,6)
    column_2 = @board_array.values_at(1,4,7)
    column_3 = @board_array.values_at(2,5,8)

    return column_1, column_2, column_3

  end

end
