class Board

  attr_accessor :board_array

  def initialize
    @board_array = { [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ] }
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
b = Board.new
b.draw_board
