# frozen_string_literal: true

require 'spec_helper'
require_relative '../player'

describe Player do
  describe '#initialize' do
    it 'takes in a name and a symbol and sets them as instance variables' do
      player = Player.new('player1', 'X')
      expect(player.name).to eq('player1')
      expect(player.symbol).to eq('X')
    end
  end
end
