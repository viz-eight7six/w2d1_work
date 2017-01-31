require_relative 'board'

class Piece



  def initialize(pos, board)
    @pos = pos
    @board = board
  end

  def valid_moves
    self.moves
  end



end
