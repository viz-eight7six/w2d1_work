# require_relative 'piece'
require_relative 'null_piece'
require 'byebug'

class Board
  attr_reader :grid

  def initialize()
    @grid = set_up_board

  end

  def set_up_board
    # called make_starting_grid in the uml file
    every_null_piece = NullPiece.new
    grid = Array.new(8) {Array.new(8)}
    grid.each_with_index do |row, idx|
      row.each_with_index do |el, idx2|
        if idx <= 1 || idx >= 6
          grid[idx][idx2] = Piece.new([idx, idx2], self)
        else
          grid[idx][idx2] = every_null_piece
        end
      end
    end
    grid
  end

  def []=(pos, piece)
    x, y = pos
    @grid[x][y] = piece
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def move_piece(start_pos, end_pos)
    if can_start_here?(start_pos) || in_board?(end_pos)
      piece = self[start_pos]
      self[end_pos] = piece
      self[start_pos] = NullPiece.new
    end
  end

  def can_start_here?(pos)
    return false if self[pos].class == NullPiece
    in_board?(pos)
  end

  def in_board?(pos)
    x, y = pos
    return false if x < 0 || x > 7 || y < 0 || y > 7
    true
  end

  def dup
    # duplicates the board inside of move_into_check to
    # make sure we can't do that (ensures we don't change the
    # original board)
  end

end
