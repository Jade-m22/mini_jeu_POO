require 'bundler'
Bundler.require

class Game
  attr_accessor :human_player, :players_left, :enemies_in_sight

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies_in_sight = []
    @players_left = 10
  end

  def kill_player(player)
    @enemies_in_sight.delete(player) if player.life_points <= 0
  end

  def is_still_ongoing?
    @human_player.life_points > 0 && !@enemies_in_sight.empty?
  end

  
  def show_players
    puts "\n          👑 VOICI TON ÉTAT ACTUEL 👑 "
    @human_player.show_state
    puts "\n"

    puts "⬇️ Ennemis toujours en vie ⬇️"
    @enemies_in_sight.each_with_index do |enemy|
      if enemy.life_points > 0
        puts "> #{enemy.name} a #{enemy.life_points} points de vie"
      end
    end
  end

  def new_players_in_sight
    if @enemies_in_sight.length == @players_left
      puts "👀 Tous les joueurs sont déjà en vue 👀"
    end
    arrived_enemies = rand(1..6)
    if arrived_enemies == 1
      puts "🚫 Aucun nouvel ennemi n'est en route 🚫"
    elsif arrived_enemies >= 2 && arrived_enemies <= 4
      puts "👿 Un nouvel ennemi arrive 👿"
      if @enemies_in_sight.length < 10
        new_enemy = Player.new("joueur#{rand(1000..9999)}")
        @enemies_in_sight << new_enemy
        @players_left -= 1
      end
    else
      puts "👿👿 2 nouveaux ennemis arrivent 👿👿"
      if @enemies_in_sight.length < 10
        2.times do
          new_enemy = Player.new("joueur#{rand(1000..9999)}")
          @enemies_in_sight << new_enemy
          @players_left -= 2
        end
      end
    end
  end


  def menu
    puts "\n"
    puts "Quelle action veux-tu effectuer ?"
    puts "a - 🔫 Chercher une meilleure arme 🔫"
    puts "s - 💊 Chercher à se soigner 💊"
    puts "⚔️ Ou attaquer un joueur en vue ⚔️"
    @enemies_in_sight.each_with_index do |enemy, index|
      if enemy.life_points > 0
        puts "#{index} - #{enemy.name} (qui a #{enemy.life_points} points de vie)"
      end
    end
  end

  def menu_choice
    choice = gets.chomp
    if choice == "a"
      human_player.search_weapon
    elsif choice == "s"
      human_player.search_health_pack
    elsif choice.to_i.to_s == choice && choice.to_i < @enemies_in_sight.length
      human_player.attacks(@enemies_in_sight[choice.to_i])
      kill_player(@enemies_in_sight[choice.to_i]) if @enemies_in_sight[choice.to_i].life_points <= 0
    end
  end

  def enemies_attack
    puts "\n🧨 Les autres joueurs t'attaquent ! 🧨\n"
    @enemies_in_sight.each do |enemy|
      if enemy.life_points > 0
        enemy.attacks(@human_player)
        puts "\n"
      end
    end
  end

  def end_game
    puts "\nLa partie est terminée"
    if @human_player.life_points > 0
      puts "BRAVO, TU AS GAGNÉ !"
    else
      puts "LOOSER !"
    end
  end
end

  # def play
  #   while is_still_ongoing?
  #     show_players
  #     new_players_in_sight
  #     menu
  #     print "\nTon choix : "
  #     menu_choice
  #     enemies_attack if is_still_ongoing?
  #   end
  #   end_game
  # end