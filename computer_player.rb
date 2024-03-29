class ComputerPlayer

  include GetLines

  attr_accessor :first_move

  def initialize
    @corners = [ 1, 3, 7, 9]
    @first_move = nil
    @second_move = nil
  end

  def mark_the_board(board_array, which_player)

    cpu_choice = cpu_decides_which_space(board_array, which_player)

    board_array[cpu_choice] = which_player

    return board_array

  end

  def cpu_decides_which_space(board_array, which_player)

    cpu_choice = false

    cpu_choice ||= complete_for_win?(which_player, get_lines(board_array))

    cpu_choice ||= block_opponent?(get_lines(board_array))

    cpu_choice ||= stop_three_corner_strategy?(board_array, which_player)

    cpu_choice ||= play_strategy(board_array, which_player)

    return cpu_choice - 1

  end

  def block_opponent?(array_of_lines)

    array_of_lines.flatten(1).each do |line|

      available_space = any_spaces_available?(line).first
      if section_should_be_blocked?(line) && available_space
        return available_space
      end

    end

    return false

  end

  def section_should_be_blocked?(array)
    array.uniq.size == 2
  end

  def complete_for_win?(which_player, array_of_lines)

    array_of_lines.flatten(1).each do |line|


      if section_should_be_blocked?(line)

        if line.uniq[0].is_a?(Integer) && line.uniq[1] == which_player
          return any_spaces_available?(line).first
        elsif line.uniq[1].is_a?(Integer) && line.uniq[0] == which_player
          return any_spaces_available?(line).first
        end

      end

    end

    return false

  end

  def any_spaces_available?(line)

    new_line = line.clone

    new_line = new_line.delete_if { |element| element.is_a? String}

    new_line << false if new_line.empty?

    return new_line

  end

  def get_other_player(which_player)

    other_player = nil
    if which_player == 'X'
      other_player = 'O'
    else
      other_player = 'X'
    end

    return other_player

  end

  def stop_three_corner_strategy?(board_array, which_player)

    other_player = get_other_player(which_player)

    diagonals = Array.new
    diagonals = get_diagonals(board_array)

    space = false

    diagonals.each do |diagonal|

       if diagonal.first == other_player || diagonal.last == other_player

        if board_array.uniq.size == 9 && board_array.include?(5) && which_player == 'O'
          space = 5
        elsif board_array.uniq.size == 8 && board_array[4] == which_player
          space = 2 if board_array.include? 2
          space = 4 if board_array.include? 4
          space = 6 if board_array.include? 6
          space = 8 if board_array.include? 8
        end

      end
    end

    return space
  end

  def play_strategy(board_array, which_player)
    space = false

    other_player = get_other_player(which_player)

    if board_array.uniq.size == 9
      diagonals = Array.new
      diagonals = get_diagonals(board_array)

      diagonals.each do |diagonal|
        space = diagonal.first if diagonal.last == other_player
        space = diagonal.last if diagonal.first == other_player
      end

      space ||= corner_if_available(board_array)
    elsif board_array.uniq.size == 8
      space = corner_if_available(board_array)
    elsif board_array.uniq.size <= 7
      space = 5 if board_array.include? 5
      space = corner_if_available(board_array) unless space
      space = any_spaces_available?(board_array).sample unless space
    end

    array_of_lines = get_lines(board_array)

    array_of_lines.flatten(1).each do |line|

      if line.uniq.size == 3 && line.include?(which_player) && !line.include?(other_player)
        marked_index = line.index(which_player)
        line.delete_at(marked_index)
        space = line.sample
      end
    end

    if 1 == board_array.count {|element| element == other_player}
      other_players_space = board_array.index(other_player)
      [1,3,5,7].each do |edge|
        if other_players_space == edge
          space = 5
        end
      end

    end

    if board_array.values_at(0,5) == [other_player, other_player]
      space = 2
    end

    if board_array == [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
      @first_move = @corners.sample
      space = @first_move
    elsif 2 == board_array.count { |element| element.is_a? String } || 4 == board_array.count { |element| element.is_a? String }
      space = false
      space = corner_if_available(board_array)
    elsif space == false
      space = corner_if_available(board_array)
      space ||= 5 if board_array.include? 5
      board_clone = board_array.clone.delete_if {|x| x.is_a? String} unless space
      space ||= board_clone.sample
    end

    return space

  end

  def corner_if_available(board_array)
    space = 1 if board_array.include? 1
    space = 3 if board_array.include? 3
    space = 7 if board_array.include? 7
    space = 9 if board_array.include? 9

    return space

  end

end
