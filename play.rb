require './setup.rb'
require './victory_checks.rb'
require './board.rb'
require './human_player.rb'
require './computer_player.rb'
require './game.rb'


tictactoe = Game.new

dont_want_to_play_again = false

until dont_want_to_play_again
  puts "Would you like to play again? (1 for yes, 2 for no)"
  input = gets.chomp
  if input == '1'
    tictactoe = Game.new
  elsif input == '2'
    dont_want_to_play_again = true
    puts "Thanks for playing!"
  else
    "Please enter a 1 (to play again) or a 2 (to quit playing)"
  end
end
