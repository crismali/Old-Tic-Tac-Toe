class Game

  attr_accessor :board, :player_1, :player_2

  def initialize
    @board = Board.new
    @player_1 = HumanPlayer.new
    #calls a method that intros the game
    introduce_game
    #asks if it's human vs. human or human vs. cpu
    play_against_friend_or_cpu?
  end

  def introduce_game
    system 'clear'
    puts "Welcome to Tic-Tac-Toe!"
    puts "\nRules:"
    puts "  -You may not mark a region that has already been marked"
    puts "  -You win by getting 3 of your mark (an 'X' or an 'O') in a row"
    puts "  -This can be done horizontally, vertically, or diagonally."
    puts "\nNow that you know the rules, you're ready to play the game!\n"
  end

  def play_against_friend_or_cpu?
    puts "\nWould you like to play against a friend (option 1)"
    puts "or against the computer (option 2)?\n"

    user_input = gets.chomp

    if user_input.chomp == "1"
      #plays against other human taking turns
      @player_2 = HumanPlayer.new
    elsif user_input == "2"
      #plays against computer
      @player_2 = ComputerPlayer.new
    else
      puts "Please enter a 1 or a 2."
      play_against_friend_or_cpu?
    end

    play_a_round
  end

  def play_a_round
    # did_anyone_win?
    #whatever needs to happen to make a round happen


  end

  def did_anyone_win?
    #figure out if someone has one or if it's a cat's game
    who_won = nil
    who_won = diagonal_win?


  end

  def diagonal_win?

    if @board.board_array[0] == @board.board_array[4] && @board.board_array[0] == @board.board_array[8]
      return true
    elsif @board.board_array[2] == @board.board_array[4] && @board.board_array[2] == @board.board_array[6]
      return true
    else
      return nil
    end

  end

  def horizontal_win?(letter)



  end

  def vertical_win?(letter)


  end

end

g = Game.new
g.board.draw_board
