module AxisMove

  def self.valid_move?(start,end_pos)
    axis_move_pool(start).include?(end_pos)
  end

  def axis_move_pool(start)
    pool = []
    x,y = start
    (0..7).to_a.each do |idx|
      pool << [x,idx] unless y == idx
      pool << [idx,y] unless x == idx
    end
    pool
  end

end
