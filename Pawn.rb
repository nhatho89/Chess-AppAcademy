require_relative 'Piece'
class Pawn < Piece

  attr_reader :color, :symbol, :board

  def initialize(color,board)
    super(color, board)
    @symbol = " ♙ "
    @board = board.deep_dup
  end

  def valid_move?(start,end_pos)
    moves = move_pool(start)
    if color == "red"
      if start.first == 1
        [[start.first+1, start.last], [start.first+2, start.last]].include?(end_pos)
      else
        [start.first+1,start.last] == end_pos
      end

    elsif color == "black"
      if start.first == 6
        [[start.first-1, start.last], [start.first-2, start.last]].include?(end_pos)
      else
        [start.first-1,start.last] == end_pos
      end
    end


  end

  def move_pool(start)
    move_pool = [[start.first+1,start.last],[start.first+2,start.last]]

    legal_moves = move_pool.select do |pos|
      pos[0].between?(start.first+1,start.first+2) && pos[1].between?(0,7)
    end
    move_pool
  end

end
