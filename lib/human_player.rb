
class HumanPlayer < Player

  def get_healing
    @life_points = 30
    puts "#{@name} a désormais #{@life_points} points de vie."
  end

  def get_better_weapon
    @weapon += 1
    puts "#{@name} a désormais une arme améliorée (dégâts x #{@weapon}) !"
  end

end

def engage_combat
  loop do 
    puts "[Entrée] pour démarrer le combat"
    choice = gets
      if choice == "\n"
        break
      else
        puts "[Entrée] pour démarrer le combat"
      end
    end
end

def next_round
    loop do 
    puts "[Entrée] pour passer au round suivant"
    choice = gets
      if choice == "\n"
        break
      else
        puts "[Entrée] pour passer au round suivant"
      end
    end
end

def ennemies_phase
    loop do 
  puts "[Entrée] pour voir la suite du combat"
  choice = gets
  if choice == "\n"
    break
  else
    puts "[Entrée] pour voir la suite du combat"
  end
  end
end