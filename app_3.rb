require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/Human_player'

# Démarrage du jeu
row_intro = [["Bienvenue dans POO III !"]]
table_intro = Terminal::Table.new :rows => row_intro
puts table_intro

# Initialiation du joueur
puts "Quel est ton nom de joueur ? "
player_name = gets.chomp
my_game = Game.new(player_name)

# Présentation des joueurs
my_game.show_players
follow_script 

# Lancement du jeu
i = 0
loop do
i += 1
rows_round = []
rows_round << ['Round', i]
table_round = Terminal::Table.new :rows => rows_round
puts table_round

# Choix du joueurs
my_game.menu
my_game.menu_choice
follow_script 

# Phase d'attaque des ennemis
rows_attack = []
rows_attack << ["Attaque des ennemis", "Round #{i}"] if my_game.is_still_ongoing? == true
table_attack = Terminal::Table.new :rows => rows_attack
puts table_attack

my_game.enemies_attack
follow_script 

# Check si la partie continue
if my_game.is_still_ongoing? == false
break # Fin de la boucle de jeu
end

end
my_game.end

# binding.pry
