class Game

  include Setup

  attr_accessor :player_1, :player_2, :board_array

  def initialize
    @board_array = { [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ] }
    @player_1 = HumanPlayer.new
    #calls a method that intros the game
    introduce_game
    #asks if it's human vs. human or human vs. cpu
    play_against_friend_or_cpu?
  end

  def play_a_round
    # did_anyone_win?
    #whatever needs to happen to make a round happen
    return "Cat's game!" if cats_game?
    @player_1.mark_the_board(@board_array)
    @player_2.mark_the_board(@board_array)
    did_anyone_win?
  end

  def cats_game?
    @board_array.uniq.size == 2
  end

  def did_anyone_win?

    who_won = false
    who_won = diagonal_win?
    who_won = horizontal_win? unless who_won
    who_won = vertical_win? unless who_won
    return who_won

  end

  def diagonal_win?

    diagonal_1 = @board_array.values_at(0,4,8)
    diagonal_2 = @board_array.values_at(2,4,6)

    if all_same_elements?(diagonal_1)
      return diagonal_1.first
    elsif all_same_elements?(diagonal_2)
      return diagonal_2.first
    else
      return false
    end

  end

  def horizontal_win?

    row_1 = @board_array.take(3)
    row_2 = @board_array.values_at(3,4,5)
    row_3 = @board_array.values_at(6,7,8)

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

    column_1 = @board_array.values_at(0,3,6)
    column_2 = @board_array.values_at(1,4,7)
    column_3 = @board_array.values_at(2,5,8)

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

  def draw_board
   system ('clear')

   puts "     |     |      "
   puts "  #{ @board_array[0] }  |  #{ @board_array[1] }  |  #{ @board_array[2] }"
   puts "_____|_____|_____"
   puts "     |     |    "
   puts "  #{ @board_array[3] }  |  #{ @board_array[4] }  |  #{ @board_array[5] }"
   puts "_____|_____|_____"
   puts "     |     |    "
   puts "  #{ @board_array[6] }  |  #{ @board_array[7] }  |  #{ @board_array[8] }"
   puts "     |     |    "
 end

end
