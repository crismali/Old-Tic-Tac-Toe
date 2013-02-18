class Game

  include Setup
  include VictoryChecks

  attr_accessor :player_1, :player_2, :board_array, :who_won

  def initialize
    @board_array = { [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ] }
    @player_1 = HumanPlayer.new
    @player_2 = nil
    @who_won = false

    introduce_game

    play_against_friend_or_cpu?

    play_a_round

  end

  def play_a_round
    #put players in array so .each can be used and the repeated code can be put in a block
    @player_1.mark_the_board(@board_array)

    did_anyone_win?

    return "Cat's game!" if cats_game?

    @player_2.mark_the_board(@board_array)

    did_anyone_win?

    return "Cat's game!" if cats_game?
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
