require_relative 'piece'
require_relative 'rook'
require_relative 'bishop'
require_relative 'queen'
require_relative 'knight'
require_relative 'pawn'
require_relative 'king'
require_relative 'null_piece'
require 'byebug'

class Board
  attr_reader :grid

  def initialize()
    @grid = set_up_board
  end

  def set_up_board
    # called make_starting_grid in the uml file
    every_null_piece = NullPiece.instance
    grid = Array.new(8) {Array.new(8)}
    grid.each_with_index do |row, idx|
      case idx
      when 0, 7
        grid[idx] = first_row(idx)
      when 1, 6
        grid[idx] = second_row(idx)
      else
        row.each_with_index do |el, idx2|
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
    available_moves = self[start_pos].moves
    return nil unless available_moves.include?(end_pos)
    if can_start_here?(start_pos) || in_board?(end_pos)
      piece = self[start_pos]
      self[end_pos] = piece
      self[start_pos] = NullPiece.instance
      piece.pos = end_pos
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

  def first_row(idx)
    first_row_arr = Array.new(8)
    color = idx == 0 ? "blue" : "red"
    first_row_arr.each_index do |idx2|
      if idx2 == 0 || idx2 == 7
        first_row_arr[idx2] = Rook.new([idx,idx2], self, color)
      elsif idx2 == 1 || idx2 == 6
        first_row_arr[idx2] = Knight.new([idx, idx2], self, color)
      elsif idx2 == 2 || idx2 == 5
        first_row_arr[idx2] = Bishop.new([idx, idx2], self, color)
      elsif idx2 == 3
        first_row_arr[idx2] = Queen.new([idx, idx2], self, color)
      else
        first_row_arr[idx2] = King.new([idx, idx2], self, color)
      end
    end
    return first_row_arr
  end

  def second_row(idx)
    color = idx == 1 ? "blue" : "red"
    second_row_arr = Array.new(8)
    second_row_arr.each_index do |idx2|
      second_row_arr[idx2] = Pawn.new([idx, idx2], self, color)
    end
    second_row_arr
  end

  def in_check(color)
    k_pos = king_pos(color)
    each_piece do |el|
      if el.color != color
        return k_pos if el.moves.include?(k_pos)
      end
    end
    nil
  end

  def checkmate?(color)
    each_piece do |el|
      possible_moves = el.moves
      possible_moves.each do |possible_move|
        new_board = self.deep_dup
        new_board[possible_move] = el
        if in_check?(color).nil?
          return false
        end
      end
    end
    true
  end

  def king_pos(color)
    each_piece do |el|
      return el.pos if el.class == King && el.color == color
    end
  end

  def each_piece(&prc)
    grid.each_with_index do |row, idx|
      row.each_with_index do |el, idx2|
        prc.call(el)
      end
    end
  end

  def deep_dup
    new_board = self.class.new
    grid.each_with_index do |row, idx|
      row.each_with_index do |el, idx2|
        if el.class == NullPiece
          new_board[[idx,idx2]] = NullPiece.instance
        else
          new_board[[idx, idx2]] = el.deep_copy([idx,idx2], new_board)
        end
      end
    end
    new_board
  end

end
