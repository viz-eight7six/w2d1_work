require_relative 'piece'
require_relative 'stepping_piece'

class King < Piece

include SteppingPiece
  def initialize(pos, board, color)
    super(pos, board, color)
  end

  def symbol
    "K"
  end

  def move_dirs
    :king
  end
end
