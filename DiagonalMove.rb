module DiagonalMove
  def diagonal_valid?(start,end_pos)
    diagonal_move_pool(start).include?(end_pos)
    # if (start.first - end_pos.first).abs == (start.last - end_pos.last).abs
    #   return true
    # end
    # false
  end

  def diagonal_move_pool(start)
    x,y = start
    pool = []
    min = [x,y].min
    (7-min).times { |i| i+=1; pool << [x + i, y + i]}
    (7-min).times { |i| i+=1; pool << [x + i, y - i]}
    min.times { |i| i+=1; pool << [x - i, y + i]}
    min.times { |i| i+=1; pool << [x - i, y - i]}
    pool.select {|arr| arr.first.between?(0,7) && arr.last.between?(0,7)}
  end
end
