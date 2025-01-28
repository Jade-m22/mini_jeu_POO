require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------\n"
puts "        🥷 BIENVENUE DANS LE GAME ! 🥷 \n"
puts "            🎯 Le but ? Survivre ! 🎯"
puts "-------------------------------------------\n"

puts "Quel est ton nom de combattant ?"
human_player_name = gets.chomp
my_game = Game.new(human_player_name)
puts "\n"

my_game.new_players_in_sight
while my_game.is_still_ongoing?
  my_game.show_players
  my_game.new_players_in_sight
  my_game.menu
  print "\nTon choix : "
  my_game.menu_choice
  my_game.enemies_attack
end
my_game.end_game


binding.pry
puts "end of file"