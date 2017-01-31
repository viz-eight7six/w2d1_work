module SlidingPiece

  def moves(pos, direction)
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
    (0..7).each do |num|
      valid_moves << [x, num] unless [x, num] == pos
      valid_moves << [num, y] unless [num, y] == pos
    end
    valid_moves
  end

  def diagonal(pos)
    x, y = pos
    valid_moves = []
    (1..7).each do |num|
      valid_moves << [x+num, y+num] if valid_position?([x + num, y + num])
      valid_moves << [x-num, y-num] if valid_position?([x-num, y-num])
      valid_moves << [x+num, y-num] if valid_position?([x+num, y-num])
      valid_moves << [x-num, y+num] if valid_position?([x-num, y+num])
    end
    valid_moves
  end

  def grow_unblocked_moves_in_dir(dx,dy)

  end

  def valid_position?(pos)
    x, y = pos
    return false if x < 0 || x > 7 || y < 0 || y > 7
    true
  end
end
