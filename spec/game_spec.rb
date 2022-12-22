# frozen_string_literal: true
# rubocop:disable Metrics/BlockLength

require 'spec_helper'
require_relative '../game'

describe Game do
  describe '#initialize' do
    it 'should initialize with two player objects and a board object' do
      player1 = Player.new('Player 1', 'X')
      player2 = Player.new('Player 2', 'O')
      board = Board.new
      game = Game.new(player1, player2, board)

      expect(game.instance_variable_get(:@player1)).to eq player1
      expect(game.instance_variable_get(:@player2)).to eq player2
      expect(game.instance_variable_get(:@board)).to eq board
    end
  end

  describe '#play' do
    it 'should run the main game loop until the game is over' do
      player1 = Player.new('Player 1', 'X')
      player2 = Player.new('Player 2', 'O')
      board = double('board')
      game = Game.new(player1, player2, board)

      allow(board).to receive(:render)
      allow(board).to receive(:valid_move?).and_return(true)
      allow(board).to receive(:update)
      allow(board).to receive(:won?).and_return(false)
      allow(board).to receive(:draw?).and_return(false, true)
      allow(game).to receive(:gets).and_return('1')

      expect(game).to receive(:game_over?).twice.and_return(false, true)
      game.play
    end
  end

  describe '#game_over?' do
    it 'should return true if the game has been won' do
      player1 = Player.new('Player 1', 'X')
      player2 = Player.new('Player 2', 'O')
      board = double('board')
      game = Game.new(player1, player2, board)

      allow(board).to receive(:won?).and_return(true)

      expect(game.game_over?(board, player1)).to be true
    end

    it 'should return true if the game is a draw' do
      player1 = Player.new('Player 1', 'X')
      player2 = Player.new('Player 2', 'O')
      board = double('board')
      game = Game.new(player1, player2, board)

      allow(board).to receive(:won?).and_return(false)
      allow(board).to receive(:draw?).and_return(true)

      expect(game.game_over?(board, player1)).to be true
    end

    it 'should return false if the game is not over' do
      player1 = Player.new('Player 1', 'X')
      player2 = Player.new('Player 2', 'O')
      board = double('board')
      game = Game.new(player1, player2, board)

      allow(board).to receive(:won?).and_return(false)
      allow(board).to receive(:draw?).and_return(false)

      expect(game.game_over?(board, player1)).to be false
    end
  end
end
