require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/Human_player'

# Démarrage du jeu
puts "----------"
puts "Bienvenue dans le jeu !"
puts "----------"

# Initialiation du joueur
puts "Quel est ton nom de joueur ? "
player_name = gets.chomp
user = HumanPlayer.new(player_name, 30)

# Initialisation des ennemis 
player1 = Player.new("Krazgrot")
player2 = Player.new("Shimik")
ennemies = [player1, player2]
puts "Parfait, #{user.name}."
puts "Voici tes ennemis :"
ennemies.each { |ennemy| puts ennemy.name }
puts "***"

engage_combat

# Le combat
i = 0
loop do 
  # Lancement d'un round de combat
  i += 1
  puts "-----------"
  puts "Round #{i}"
  puts "-----------"
  puts "Au tour de #{user.name} !"
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts ""
  puts "attaquer un joueur en vue :"
  puts "0 - #{player1.name} a #{player1.life_points} points de vie" if player1.life_points > 0
  puts "1 - #{player2.name} a #{player2.life_points} points de vie" if player2.life_points > 0

  # Choix des options du joueur
  loop do
  print "> "
  user_input = gets.chomp.to_s
    if user_input == "a" 
      puts "***"
      user.get_better_weapon
        break
    elsif user_input == "s" 
      puts "***"
      user.get_healing
        break
    elsif user_input == "0"
      puts "***"
      user.attacks(player1)
        break
    elsif user_input == "1"
      puts "***"
      user.attacks(player2)
        break
    else 
      puts "Fais ton choix parmi les 4 options proposées !"
    end
  end

  # Victoire du joueur
  if player1.life_points <= 0 && player2.life_points <= 0 
    puts "-----------"
    puts "#{user.name} a gagné !" 
    break
  end

  # Phase d'attaque des ennemis 
  ennemies_phase
  puts "#{player1.name} et #{player2.name} attaquent !" if player1.life_points > 0 && player2.life_points > 0
  puts "Il ne reste plus que #{player1.name}. Il attaque !" if player2.life_points <=0 && player1.life_points > 0
  puts "Il ne reste plus que #{player2.name}. Il attaque !" if player1.life_points <=0 && player2.life_points > 0
  ennemies.each { |ennemy| ennemy.attacks(user) if ennemy.life_points > 0 && user.life_points > 0 }
  user.show_state if user.life_points > 0

  # Victoire des ennemis
  if user.life_points <= 0
  puts "***"
  puts "#{player1.name} et #{player2.name} ont gagné !" 
    break
  else
    next_round
  end
end