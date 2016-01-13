module SlidingMove

  def axis_valid_move?(start,end_pos)
    axis_move_pool(start).include?(end_pos)
  end

  # def axis_path(start,end_pos)
  #
  #   path = []
  #
  #   x, y = (start.first - end_pos.first), (start.last - end_pos.last)
  #
  #   if y > 0
  #     yrange = (start.last).downto(end_pos.last).to_a
  #   elsif y < 0
  #     yrange = (start.first..end_pos.first).to_a
  #   end
  #
  #   if x > 0
  #     xrange = (start.last).downto(end_pos.last).to_a
  #   elsif x < 0
  #     xrange = (start.first..end_pos.first).to_a
  #   end
  #
  #   if x == 0
  #     xrange = Array.new(yrange.length) {start.first}
  #   else
  #     yrange = Array.new(xrange.length) {start.last}
  #   end
  #
  #   xrange.length.times do |idx|
  #     path << [xrange[idx],yrange[idx]]
  #   end
  #
  #   path.shift
  #   path.pop
  #   path
  #
  # end

  # def axis_move_pool(start)
  #   pool = []
  #   x,y = start
  #   (0..7).to_a.each do |idx|
  #     pool << [x,idx] #unless y == idx
  #     pool << [idx,y] #unless x == idx
  #   end
  #   pool
  # end


  def axis_move_pool(start)
    pool = []
    x,y = start
    (0..7).to_a.each do |idx|
      pool << [x,idx] #unless y == idx
    end
    (0..7).to_a.each do |idx|
      pool << [idx,y] #unless x == idx
    end
    pool
  end

  def diagonal_valid_move?(start,end_pos)
    diagonal_move_pool(start).include?(end_pos)
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

  def diagonal_path?(start, end_pos)
    path = []

    x, y = (start.first - end_pos.first), (start.last - end_pos.last)

    if x < 0
      xrange = (start.first..end_pos.first).to_a
    elsif x > 0
      xrange = (start.first).downto(end_pos.first).to_a
    end

    if y < 0
      yrange = (start.last..end_pos.last).to_a
    elsif y > 0
      yrange = (start.last).downto(end_pos.last).to_a
    end


    xrange.length.times do |idx|
      path << [xrange[idx],yrange[idx]]
    end

    path.shift
    path.pop
    path

  end




end
