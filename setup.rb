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

    until @player_2
      user_input = gets.chomp

      if user_input.chomp == "1"
        @player_2 = HumanPlayer.new
      elsif user_input == "2"
        @player_2 = ComputerPlayer.new
      else
        puts "Please enter a 1 (for a human opponent) or a 2 (for a computer opponent)."
      end
    end
  end

  def game_over
    system ('clear')
    draw_board

    if @who_won == 'X'
      puts "#{@who_won}'s win!"
      puts "Good job, player 1!"
      puts "Better luck next time player 2" if @player_2.class == HumanPlayer
    elsif @who_won == 'O'
      puts "#{@who_won}'s win!"
      puts "Tough luck, player 1."
      puts "Good job, player 2" if @player_2.class == HumanPlayer
      puts "Now that Skynet has mastered Tic-Tac-Toe, it will focus on global conquest!" if @player_2.class == ComputerPlayer
    else
      puts @who_won
    end
  end


end
