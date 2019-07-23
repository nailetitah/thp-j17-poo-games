class Game 
  attr_accessor :human_player, :enemies

  def initialize(human_player, enemies = Player.enemies)
    @human_player = HumanPlayer.new(human_player, 30)
    @enemies = enemies
  end

  def kill_player(player)
    @enemies.delete(player)
  end

  def is_still_ongoing?
    if @enemies.map { |enemy| enemy.life_points > 0 } == true
      return false
    elsif @human_player.life_points < 0
      return false
    else true
    end
  end

  def show_players
    puts "***"
    puts "#{@human_player.name} a #{@human_player.life_points} points de vie."
    puts "Points de vie des ennemis :"
    @enemies.each { |enemy| puts "#{enemy.name} => #{enemy.life_points}" }
    puts "***" 
  end

  def menu 
    puts "Quelle action veux-tu effectuer ?"
    puts "a => chercher une meilleure arme"
    puts "s => chercher à se soigner"
    puts ""
    puts "attaquer un joueur en vue :"
    @enemies.each.with_index { |enemy, idx| puts "#{idx} => #{enemy.name} a #{enemy.life_points} points de vie." } 
    puts "***"  
  end

  def menu_choice(str ="")
    l = @enemies.length
    loop do
    print "> "
    str = gets.chomp.to_s
      if str == "a" 
        puts "***"
        @human_player.get_better_weapon
        puts "Attention, les ennemis s'apprêtent à attaquer..."
        puts "***"
          break
      elsif str == "s" 
        puts "***"
        @human_player.get_healing
        puts "Attention, les ennemis s'apprêtent à attaquer..."
        puts "***"
          break
      elsif str.to_i.between?(0,l)
        puts "***" 
        player_attacked = @enemies[str.to_i]
        @human_player.attacks(player_attacked)
        kill_player(player_attacked) if player_attacked.life_points <= 0
        puts "Attention, les ennemis s'apprêtent à attaquer..." if @enemies.length > 0
          break
      else 
        puts "Fais ton choix parmi les options proposées !"
      end
    end
  end

  def enemies_attack
    @enemies.each { |enemy|
    puts "#{enemy.name} attaque #{@human_player.name} !"
    damages = enemy.compute_damage
    puts "Il lui inflige #{damages} points de dommages."
    @human_player.gets_damage(damages)
     }
    puts "***"
    puts "Il reste #{@human_player.life_points} points de vie à #{@human_player.name}." if @human_player.life_points > 0
    puts "***" if @human_player.life_points > 0
  end

  def end
    if @human_player.life_points > 0
    rows_end = []
    rows_end << ["VICTOIRE !"]
    table_end = Terminal::Table.new :rows => rows_end
    puts table_end
    else
    rows_end = []
    rows_end << ["VOUS AVEZ PERDU."]
    table_end = Terminal::Table.new :rows => rows_end
    puts table_end
    end
  end

end

def follow_script
  loop do 
    print "[Entrée] pour continuer "
    choice = gets
      if choice == "\n"
        break
      else
        print "[Entrée] pour continuer "
      end
    end
end
