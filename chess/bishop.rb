require_relative 'piece'
require_relative 'sliding_piece'



class Bishop < Piece
include SlidingPiece
  def initialize(pos, board, color)
    super(pos, board, color)
  end

  def symbol
    'B'
  end

  def move_dirs
    :diagonal
  end

end
