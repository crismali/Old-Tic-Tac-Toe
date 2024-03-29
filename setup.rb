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

      if user_input == "1"
        @player_2 = HumanPlayer.new
      elsif user_input == "2"
        @player_2 = ComputerPlayer.new
      else
        puts "Please enter a 1 (for a human opponent) or a 2 (for a computer opponent)."
      end
    end
  end

  def who_goes_first?
    puts "\nWould you like to go first?"
    puts "(enter 1 for yes or 2 for no)"

    user_has_made_choice = false

    until user_has_made_choice
      user_input = gets.chomp
      if user_input == '1'
        user_has_made_choice = true
        return HumanPlayer
      elsif user_input == '2'
        user_has_made_choice = true
        return ComputerPlayer
      else
        puts "Please enter a 1 (to go first) or a 2 (to go second)"
      end
    end

  end

  def game_over
    system ('clear')
    draw_board

    puts "#{@who_won}'s win!" unless @who_won == "Cat's game!"

    if @who_won == "Cat's game!"
      puts @who_won
    elsif @who_won == 'X' && @player_2.class == HumanPlayer
      puts "Good job, player 1!"
      puts "Better luck next time player 2"
    elsif @who_won == 'O' && @player_2.class == HumanPlayer
      puts "Tough luck, player 1."
      puts "Good job, player 2" if @player_2.class == HumanPlayer
    elsif @players_array.first.class == HumanPlayer && @who_won == 'X'
      puts "Good job, whoever you are!"
      puts "But beware... every time Skynet loses, it becomes smarter..."
    elsif @players_array.first.class == HumanPlayer && @who_won == 'O'
      puts "Tough luck, whoever you are"
      puts "Especially because now that Skynet has mastered Tic-Tac-Toe, "
      puts "it will focus on global conquest!"
    elsif @players_array.first.class == ComputerPlayer && @who_won == 'X'
      puts "Tough luck, whoever you are"
      puts "Especially because now that Skynet has mastered Tic-Tac-Toe, "
      puts "it will focus on global conquest!"
    elsif @players_array.first.class == ComputerPlayer && @who_won == 'O'
      puts "Good job, whoever you are!"
      puts "But beware... every time Skynet loses, it becomes smarter..."
    end
  end


end
