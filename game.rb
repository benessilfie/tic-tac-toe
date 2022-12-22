# frozen_string_literal: true
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

require_relative 'board'
require_relative 'player'

# Purpose: The Game class creates a new game object that will be used to play the game
# #initialize: creates a new board and two players
# #play: starts the game
# #game_over?: checks if the game is over
class Game
  def initialize(player1, player2, board)
    @board = board
    @player1 = player1
    @player2 = player2
    @winning_player = nil
  end

  def play
    @board.render # display initial state of the board
    current_player = @player1

    loop do
      break if game_over?(@board, current_player)

      puts "#{current_player.name}, enter your move (1-9):"
      move = gets.chomp.to_i

      until @board.valid_move?(move)
        puts "Invalid move. #{current_player.name}, enter your move (1-9):"
        move = gets.chomp.to_i
      end

      @board.update(move, current_player.symbol)
      @board.render # display updated state of the board
      current_player = current_player == @player1 ? @player2 : @player1
    end
  end

  def game_over?(board, current_player)
    if board.won?
      @winning_player = current_player == @player1 ? @player2 : @player1
      puts "#{@winning_player.name} wins!"
      return true
    elsif board.draw?
      puts "It's a draw!"
      return true
    end

    false
  end
end

# Create a new game

# Create player objects
player1 = Player.new('Player 1', 'X')
player2 = Player.new('Player 2', 'O')

# Create a board object
board = Board.new

# Create a new game and start it
game = Game.new(player1, player2, board)
game.play
