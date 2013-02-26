module VictoryChecks

  include GetLines

  def cats_game?(board_array, who_won)
    board_array.uniq.size == 2 && who_won == false
  end

  def did_anyone_win?(who_won, array_of_lines)

    array_of_lines.flatten(1).each do |line|
        return line.first if all_same_elements?(line)
    end

    return false

  end

  def all_same_elements?(array)
    array.uniq.size == 1
  end

end
