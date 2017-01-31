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
      @cursor.board.grid.each_with_index do |row, idx|
        row.each_with_index do |el, idx2|
          if [idx, idx2] == @cursor.cursor_pos
            print " pos ".blue
          else
            print " pos ".red
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
