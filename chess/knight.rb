require_relative 'piece'
require_relative 'stepping_piece'

class Knight < Piece

include SteppingPiece
  def initialize(pos, board, color)
    super(pos, board, color)
  end

  def symbol
    "KN"
  end

  def move_dirs
    :knight
  end
end
