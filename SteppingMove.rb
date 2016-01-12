module SteppingMove
  def knight_move_pool(pos)
    move_pool = [
    [pos[0]-1,pos[1]+2],
    [pos[0]-2,pos[1]+1],
    [pos[0]-2,pos[1]-1],
    [pos[0]-1,pos[1]-2],
    [pos[0]+1,pos[1]-2],
    [pos[0]+2,pos[1]-1],
    [pos[0]+2,pos[1]+1],
    [pos[0]+1,pos[1]+2]
  ]

    legal_moves = move_pool.select do |pos|
      pos[0].between?(0,7) && pos[1].between?(0,7)
    end
    legal_moves
  end

  def knight_valid_move?(start,end_pos)
    knight_move_pool(start).include?(end_pos)
  end

  def king_valid_move?(start,end_pos)
    king_move_pool(start).include?(end_pos)
  end

  def king_move_pool(pos)
    move_pool = [
      [pos[0],pos[1]+1],
      [pos[0],pos[1]-1],
      [pos[0]-1,pos[1]],
      [pos[0]+1,pos[1]],
      [pos[0]+1,pos[1]+1],
      [pos[0]-1,pos[1]-1],
      [pos[0]-1,pos[1]+1],
      [pos[0]+1,pos[1]-1]
    ]

    legal_moves = move_pool.select do |pos|
      pos[0].between?(0,7) && pos[1].between?(0,7)
    end
    legal_moves
  end
end
