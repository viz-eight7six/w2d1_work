module SlidingPiece

  def moves
    pos = @pos
    direction = move_dirs
    if direction == :horizontal
      horizontal(pos)
    elsif direction == :diagonal
      diagonal(pos)
    else
      horizontal(pos) + diagonal(pos)
    end
  end
  private

  def move_dirs
    self.move_dirs
  end

  def horizontal(pos)
    x, y = pos
    valid_moves = []

    (x-1).downto(0) do |num|
      if valid_position?([num, y])
        valid_moves << [num, y]
        break if opposing_piece?([num, y])
      else
        break
      end
    end

    (x+1).upto(7) do |num|
      if valid_position?([num, y])
        valid_moves << [num, y]
        break if opposing_piece?([num, y])
      else
        break
      end
    end

    (y-1).downto(0) do |num|
      if valid_position?([x, num])
        valid_moves << [x, num]
        break if opposing_piece?([x, num])
      else
        break
      end
    end

    (y+1).upto(7) do |num|
      if valid_position?([x, num])
        valid_moves << [x, num]
        break if opposing_piece?([x, num])
      else
        break
      end
    end

    valid_moves
  end


  def diagonal(pos)
    x, y = pos
    valid_moves = []

    (x + 1).upto(7) do |mod_x|
      diff = mod_x - x
      x_num, y_num = x + diff, y + diff
      if valid_position?([x_num, y_num])
        valid_moves << [x_num, y_num]
        break if opposing_piece?([x_num, y_num])
      else
        break
      end
    end

    (x - 1).downto(0) do |mod_x|
      diff = x - mod_x
      x_num, y_num = x - diff, y - diff
      if valid_position?([x_num, y_num])
        valid_moves << [x_num, y_num]
        break if opposing_piece?([x_num, y_num])
      else
        break
      end
    end

    (x + 1).upto(7) do |mod_x|
      diff = mod_x - x
      x_num, y_num = x + diff, y - diff
      if valid_position?([x_num, y_num])
        valid_moves << [x_num, y_num]
        break if opposing_piece?([x_num, y_num])
      else
        break
      end
    end

    (x - 1).downto(0) do |mod_x|
      diff = x - mod_x
      x_num, y_num = x - diff, y + diff
      if valid_position?([x_num, y_num])
        valid_moves << [x_num, y_num]
        break if opposing_piece?([x_num, y_num])
      else
        break
      end
    end

    valid_moves
  end

  def grow_unblocked_moves_in_dir(dx,dy)

  end
end
