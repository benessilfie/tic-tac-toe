# frozen_string_literal: true
# rubocop:disable Metrics/BlockLength

require 'spec_helper'
require_relative '../board'

describe Board do
  let(:board) { Board.new }

  describe '#initialize' do
    it 'creates a 3x3 grid of empty spaces' do
      expect(board.instance_variable_get(:@grid)).to eq([[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']])
    end
  end

  describe '#render' do
    it 'displays the current state of the board' do
      expect { board.render }.to output("   |   |   \n---+---+---\n   |   |   \n---+---+---\n   |   |   \n").to_stdout
    end
  end

  describe '#update' do
    it 'updates the board with the player\'s move' do
      board.update(5, 'X')
      expect(board.instance_variable_get(:@grid)).to eq([[' ', ' ', ' '], [' ', 'X', ' '], [' ', ' ', ' ']])
    end
  end

  describe '#valid_move?' do
    it 'returns true if the position is valid and not already occupied' do
      expect(board.valid_move?(5)).to be true
    end

    it 'returns false if the position is not between 1 and 9' do
      expect(board.valid_move?(0)).to be false
      expect(board.valid_move?(10)).to be false
    end

    it 'returns false if the position is already occupied' do
      board.update(5, 'X')
      expect(board.valid_move?(5)).to be false
    end
  end

  describe '#won?' do
    it 'returns true if the game is won' do
      board.instance_variable_set(:@grid, [%w[X X X], %w[O O O], %w[X O X]])
      expect(board.won?).to be true
    end

    it 'returns false if the game is not won' do
      expect(board.won?).to be false
    end
  end

  describe '#draw?' do
    it 'returns true if the game is a draw' do
      board.instance_variable_set(:@grid, [%w[X O X], %w[O X O], %w[X O X]])
      expect(board.draw?).to be true
    end

    it 'returns false if the game is not a draw' do
      expect(board.draw?).to be false
    end
  end
end
