# frozen_string_literal: true
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

# Purpose: The Board class creates a new board object that will be used in the game class
# #initialize: creates a 3x3 grid of empty spaces
# #render: displays the current state of the board
# #update: updates the board with the player's move
# #valid_move?: checks if the player's move is valid
# #won?: checks if the game is won
# #draw?: checks if the game is a draw
class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, ' ') }
  end

  def render
    puts " #{@grid[0][0]} | #{@grid[0][1]} | #{@grid[0][2]} "
    puts '---+---+---'
    puts " #{@grid[1][0]} | #{@grid[1][1]} | #{@grid[1][2]} "
    puts '---+---+---'
    puts " #{@grid[2][0]} | #{@grid[2][1]} | #{@grid[2][2]} "
  end

  def update(position, symbol)
    row = (position - 1) / 3
    col = (position - 1) % 3
    @grid[row][col] = symbol
  end

  def valid_move?(position)
    position.between?(1, 9) && @grid[(position - 1) / 3][(position - 1) % 3] == ' '
  end

  def won?
    winning_combinations = [
      [@grid[0][0], @grid[0][1], @grid[0][2]],
      [@grid[1][0], @grid[1][1], @grid[1][2]],
      [@grid[2][0], @grid[2][1], @grid[2][2]],
      [@grid[0][0], @grid[1][0], @grid[2][0]],
      [@grid[0][1], @grid[1][1], @grid[2][1]],
      [@grid[0][2], @grid[1][2], @grid[2][2]],
      [@grid[0][0], @grid[1][1], @grid[2][2]],
      [@grid[0][2], @grid[1][1], @grid[2][0]]
    ]

    winning_combinations.any? { |combination| combination.uniq.length == 1 && combination.first != ' ' }
  end

  def draw?
    @grid.flatten.none? { |space| space == ' ' }
  end
end
