class Player
  attr_accessor :name, :life_points, :weapon
  @@enemies = []

  def initialize(name, life_points = 10, weapon = 1)
    @name = name.to_s
    @life_points = life_points.to_i
    @weapon = weapon.to_i
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie."
  end

  def gets_damage(d)
    @life_points -= d
    if @life_points <= 0
     puts "#{@name} a été tué au combat."
    end
  end

  def attacks(player)
    puts "#{self.name} attaque #{player.name} !"
    damages = compute_damage * @weapon
    puts "Il lui inflige #{damages} points de dommages."
    player.gets_damage(damages)
  end

  def compute_damage
    return rand(1..6)
  end

  def self.enemies
    (1..4).each { @@enemies << Player.new(random_name) }
    @@enemies
  end

end

def random_name
    (0...6).map { ('a'..'z').to_a[rand(26)] }.join.capitalize
end




