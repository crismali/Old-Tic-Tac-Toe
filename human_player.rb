class HumanPlayer

  def mark_the_board(board_array, which_player)

    puts "Please enter a number that corresponds to an unmarked space."
    puts "(psst, in case you forgot, you're #{which_player}'s)"

    valid = false

    until valid do
      input = gets.chomp
      valid = valid_human_input?(input, board_array)
    end

    board_array[input.to_i - 1] = which_player

    return board_array
  end

  def valid_human_input?(input, board_array)

   if input.to_i > 9 || input.to_i < 1
      puts "Invalid choice. Only numbers 1-9 are accepted."
      return false
    elsif board_array[input.to_i - 1].is_a? Integer
      return true
    else
      puts "You or the other player has already selected that space."
      puts "Please select a different space."
      return false
    end

  end


end

