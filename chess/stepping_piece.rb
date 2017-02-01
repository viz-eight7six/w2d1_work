require 'byebug'

module SteppingPiece

  START_PAWN_UP = [
    [-1, 0],
    [-1,1],
    [-1,-1],
    [-2,0]
  ]

  START_PAWN_DOWN = [
    [1, 0],
    [1,1],
    [1,-1],
    [2,0]
  ]

  PAWN_UP = [
    [-1, 0],
    [-1,1],
    [-1,-1],
  ]

  PAWN_DOWN = [
    [1, 0],
    [1,1],
    [1,-1],
  ]

  KING = [
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 0],
    [1, 1]
  ]

  KNIGHT = [
    [-1, 2],
    [-2, -1],
    [-2, 1],
    [-1, 2],
    [1, -2],
    [2, -1],
    [2, 1],
    [1, 2]
  ]

  def moves
    case move_dirs
    when :starting_pawn_up then base_pos(START_PAWN_UP, @pos)
    when :starting_pawn_down then base_pos(START_PAWN_DOWN, @pos)
    when :pawn_up then base_pos(PAWN_UP, @pos)
    when :pawn_down then base_pos(PAWN_DOWN, @pos)
    when :knight then base_pos(KNIGHT, @pos)
    when :king then base_pos(KING, @pos)
    else
    end
  end

  def base_pos(move_list, pos)
    valid_moves = []
    move_list.each do |change_pos|
      x, y = change_pos
      test_pos = [pos[0] + x, pos[1] + y]
      valid_moves << test_pos if self.valid_position?(test_pos)
    end
    valid_moves
  end

  def move_dirs
    self.move_dirs
  end

end
