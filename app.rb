require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Krazgrot")
player2 = Player.new("Shimik")

puts "A ma droite : #{player1.name}"
puts "A ma gauche : #{player2.name}"
puts "Voici l'état de chaque joueur :"
puts "#{player1.name} a #{player1.life_points} points de vie."
puts "#{player2.name} a #{player2.life_points} points de vie."
puts "-----------"
puts "Passons au Round 1 "
puts "-----------"
puts "#{player1.name} aura l'honneur d'attaquer en premier."
player1.attacks(player2)
player2.show_state
puts "#{player2.name} ne se laisse pas faire et réplique."
player2.attacks(player1)
player1.show_state

i = 1
loop do
  i += 1
  puts "-----------"
  puts "Round #{i}"
  puts "-----------"
  player1.attacks(player2)
  player2.show_state
  if player2.life_points <= 0 
    puts "-----------"
    puts "#{player1.name} a gagné !" 
    break
  end
  player2.attacks(player1)
  player1.show_state
  if player1.life_points <= 0
  puts "***"
  puts "#{player2.name} a gagné !" 
    break
  end
end

# binding.pry