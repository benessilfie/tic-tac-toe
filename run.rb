# frozen_string_literal: true

require_relative 'board'
require_relative 'player'
require_relative 'game'

# Create a new game

# Create player objects
player1 = Player.new('Player 1', 'X')
player2 = Player.new('Player 2', 'O')

# Create a board object
board = Board.new

# Create a new game and start it
game = Game.new(player1, player2, board)
game.play
