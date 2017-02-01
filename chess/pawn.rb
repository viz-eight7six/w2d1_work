require_relative 'piece'
require_relative 'stepping_piece'

class Pawn < Piece

include SteppingPiece
  def initialize(pos, board, color)
    super(pos, board, color)
    @start_pos = pos.dup
  end

  def symbol
    "P"
  end

  def move_dirs
    if @start_pos == @pos
      if @start_pos[0] == 1
        :starting_pawn_down
      else
        :starting_pawn_up
      end
    else
      if @start_pos[0] == 1
        :pawn_down
      else
        :pawn_up
      end
    end
  end


end
