module Setup

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


end
