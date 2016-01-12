require_relative "Error"

class Board
  attr_reader :board
  def initialize
    @board = Array.new(8) {Array.new(8,"   ")}
    populate
  end

  def populate
    idx = 0
    8.times do
      board[1][idx] = Pawn.new("white")
      board[6][idx] = Pawn.new("black")
      idx += 1
    end

    board[0][0] = Rook.new("white")
    board[0][7] = Rook.new("white")
    board[7][0] = Rook.new("black")
    board[7][7] = Rook.new("black")

    board[0][1] = Knight.new("white")
    board[0][6] = Knight.new("white")
    board[1][7] = Knight.new("black")
    board[6][7] = Knight.new("black")

    board[0][2] = Bishop.new("white")
    board[0][5] = Bishop.new("white")
    board[2][7] = Bishop.new("black")
    board[5][7] = Bishop.new("black")

    board[0][3] = Queen.new("white")
    board[3][7] = Queen.new("black")

    board[0][4] = King.new("white")
    board[4][7] = King.new("black")
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
