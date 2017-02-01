require_relative 'piece'
require 'singleton'

class NullPiece < Piece
  def initialize
  end

  def symbol
    "N"
  end

  include Singleton

  def moves
    []
  end

end
