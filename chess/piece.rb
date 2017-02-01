require_relative 'board'

class Piece

attr_reader :color, :board
attr_accessor :pos

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def valid_moves
    self.moves
  end

  def valid_position?(pos)
    x, y = pos
    return false if x < 0 || x > 7 || y < 0 || y > 7
    el_at_pos = @board[[x,y]]
    return false if el_at_pos.color == @color
    # return false if el_at_pos.class != NullPiece
    true
  end

  def pos=(pos)
    @pos = pos
  end

  def opposing_piece?(pos)
    if @color == 'red'
      return @board[pos] == 'blue'
    else
      return @board[pos] == 'red'
    end
    false
  end

  def deep_copy(pos, passed_board)
    copy = self.class.new(pos, passed_board, @color)
  end



end
