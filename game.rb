#Game logic
require './player'

class Game
  
  def initialize 
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @players = [@player1, @player2]
  end

  def current_player
    @players.first
  end

  def new_turn
    puts
    puts "----- NEW TURN -----"
    @players.rotate!
  end

  def question
    num1 = rand(1..20)
    num2 = rand(1..20)
    @correct_answer = num1 + num2
    
    puts "#{current_player.name}: What does #{num1} plus #{num2} equal?"
    
  end

  def scores
    puts "#{@player1.name}: #{@player1.life}/3 vs #{@player2.name}: #{@player2.life}/3"
  end

  def game_over?
    @player1.life == 0 || @player2.life == 0
  end

  def winner
    puts "#{current_player.name} wins with a score of #{current_player.life}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def start
  
    until game_over? do
      
      question
      answer = gets.chomp
     
      if answer.to_i == @correct_answer
        puts "YES! You are correct."
      else
        puts "Seriously? No!"
        current_player.lose_a_life
      end 
      
      scores
      new_turn

    end

    if game_over?
      winner
    end
    
  end
end