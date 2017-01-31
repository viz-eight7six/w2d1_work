require_relative 'piece'
require_relative 'sliding_piece'



class Bishop < Piece
include SlidingPiece
  def initialize(pos, board)
    super(pos, board)
  end

  def move_dirs
    :diagonal
  end

end
