require_relative 'piece'
require_relative 'sliding_piece'

class Queen < Piece
include SlidingPiece
  def initialize(pos, board, color)
    super(pos, board, color)
  end

  def symbol
    "Q"
  end

  def move_dirs
    :both
  end
end
