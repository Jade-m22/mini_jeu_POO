require "pry"

class Player
  attr_accessor :name, :life_points

  @@all_players = []

  def initialize(name)
    @name = name
    @life_points = 10
    @@all_players << self
  end

  def show_state
    puts "#{name} a #{life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points -= damage
    if @life_points <= 0
      puts "Terminé ! Le joueur #{name} a été tué."
    else
      puts "Il reste #{life_points} points de vie à #{name}"
    end
  end

  def attacks(player)
    puts "Le joueur #{name} attaque le joueur #{player.name}"
    damage = compute_damage
    puts "#{name} inflige #{damage} points de dommage à #{player.name}."
    player.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
    @@all_players << self
  end

  def show_state
    puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    dice_number = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{dice_number}"
    if dice_number <= weapon_level
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    else
      @weapon_level = dice_number
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    end
  end 

  def search_health_pack
    pack_number = rand(1..6)
    if pack_number == 1
      puts "Tu n'as rien trouvé... "
    elsif pack_number <= 2 && pack_number >= 5
      @life_points = [@life_points += 50, 100].min 
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    else 
      @life_points = [@life_points += 80, 100].min
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end

end
# binding.pry
# puts "end of file"