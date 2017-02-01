require_relative 'piece'
require_relative 'sliding_piece'

class Rook < Piece
  include SlidingPiece

  def initialize(pos, board, color)
    super(pos, board, color)
  end

  def symbol
    "R"
  end

  def move_dirs
    :horizontal
  end
end
