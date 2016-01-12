require_relative "Error"

class Board
  attr_reader :board
  def initialize
    @board = Array.new(8) {Array.new(8,"   ")}
    @board[0][5] = " X "
    populate
  end

  def populate

  end

  def in_bounds?(pos)
    pos.first.between?(0,7) && pos.last.between?(0,7)
  end

  def move(start, end_point)
    #check if there is a pice on start
      #raise exception if start.nil?
    #if end_pos is valid_move?
    # begin
      if start.nil?
        # raise "There is no piece there!"
      else
        board[end_point.first][end_point.last] = board[start.first][start.last].dup
        board[start.first][start.last] = "   "

      end
    # rescue InvalidMoveError

  end



  def valid_move?(start, end_point)
    # if end point is off board
  end

end
