class Game

  include Setup
  include VictoryChecks

  attr_accessor :player_1, :player_2, :players_array, :board_array, :who_won, :players_array, :which_player

  def initialize
    @board_array = [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
    @player_1 = HumanPlayer.new
    @player_2 = nil
    @who_won = false
    @which_player = 0
    introduce_game

    play_against_friend_or_cpu?

    @players_array = [ @player_1, @player_2 ]

    until @who_won
      play_a_round
    end

    game_over

  end

  def play_a_round

    @players_array.each do |player|

      draw_board if player.class == HumanPlayer

      @which_player = @players_array.index(player)

      @board_array = player.mark_the_board(@board_array, @which_player)

      did_anyone_win?

      @who_won = "Cat's game!" if cats_game?

      break if @who_won
    end

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
