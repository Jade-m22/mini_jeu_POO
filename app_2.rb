require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-----------------------\n"
puts "BIENVENUE DANS LE GAME !\n"
puts "Le but ? Survivre !"
puts "-----------------------\n"

puts "Quel est ton nom de combattant ?"
@name = gets.chomp
player3 = HumanPlayer.new(@name)

player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = [player1, player2]

while player3.life_points > 0 && (player1.life_points > 0 || player2.life_points >0)

  puts "Voici l'état de chaque joueur : "
  player1.show_state
  player2.show_state
  player3.show_state
  puts "\n"
  
  puts "Quelle action veux-tu effectuer ?\n"
  puts "a - chercher une meilleure arme\n"
  puts "s - chercher à se soigner\n"
  puts "attaquer un joueur en vue :\n"
  puts "0 - Josiane a #{player1.life_points} points de vie\n"
  puts "1 - José a #{player2.life_points} points de vie"
  puts "\n"

  choice = gets.chomp
    if choice == "a"
      player3.search_weapon
    elsif choice == "s"
      player3.search_health_pack
    elsif choice == "0"
      player3.attacks(player1)
    elsif choice == "1"
      player3.attacks(player2)
    end

    puts "Les autres joueurs t'attaquent !"
    enemies.each do |enemy|
      if enemy.life_points > 0
        enemy.attacks(player3)
      end
    end
  puts "\n"

end

puts "La partie est terminée"

if player3.life_points > 0
  puts "BRAVO, TU AS GAGNÉ"
else
  puts "LOOSER !"
end

binding.pry
puts "end of file"