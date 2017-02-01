require_relative 'board'
require_relative 'cursor'
require 'colorize'
require 'byebug'



class Display

  def initialize(board)
    @cursor = Cursor.new([0,0], board)
  end

  def render
    while true
      possible_king_pos = @cursor.board.in_check("blue")
      other_king_pos = @cursor.board.in_check("red")
      @cursor.board.grid.each_with_index do |row, idx|
        row.each_with_index do |el, idx2|
          if possible_king_pos == [idx, idx2] || other_king_pos == [idx, idx2]
            print " #{el.symbol} ".center(5).magenta
          elsif [idx, idx2] == @cursor.selected
            print " #{el.symbol} ".center(5).yellow
          elsif [idx, idx2] == @cursor.cursor_pos
            print " #{el.symbol} ".center(5).green
          else
            print " #{el.symbol} ".center(5).blue
          end
        end
        print "\n"
      end
      @cursor.get_input
      system("clear")
    end
  end

  def move(new_pos)
    #updates the board after a move is made
  end

end
