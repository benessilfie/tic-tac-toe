# frozen_string_literal: true

# Purpose: The Player class creates a new player object that will be used in the game class
# #initialize: creates a new player
# #name: returns the player's name
# #symbol: returns the player's symbol
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
