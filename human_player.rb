class HumanPlayer

  def mark_the_board(board_array)

    valid = false

    until valid do
      input = gets.chomp
      valid = valid_human_input?(input, board_array)
    end
    return input
  end

  def valid_human_input?(input, board_array)

    if input > 9 || input < 1 || !input.is_a? Integer
      puts "Invalid choice. Only numbers 1-9 are accepted."
      return false
    elsif board_array[input - 1].int?
      return true
    else
      puts "You or the other player has already selected that space."
      puts "Please select a different space."
      return false
    end

  end


end

