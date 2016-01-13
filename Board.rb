require_relative "Requirements"

class Board
  attr_reader :board
  def initialize
    @board = Array.new(8) {Array.new(8,Blank.new)}
    populate
  end

  def populate
    idx = 0

    player_one_color = "red"
    player_two_color = "black"

    8.times do
      board[1][idx] = Pawn.new(player_one_color, self)
      board[6][idx] = Pawn.new(player_two_color, self)
      idx += 1
    end

    board[0][0] = Rook.new(player_one_color, self)
    board[0][7] = Rook.new(player_one_color, self)
    board[7][0] = Rook.new(player_two_color, self)
    board[7][7] = Rook.new(player_two_color, self)

    board[0][1] = Knight.new(player_one_color, self)
    board[0][6] = Knight.new(player_one_color, self)
    board[7][1] = Knight.new(player_two_color, self)
    board[7][6] = Knight.new(player_two_color, self)

    board[0][2] = Bishop.new(player_one_color, self)
    board[0][5] = Bishop.new(player_one_color, self)
    board[7][2] = Bishop.new(player_two_color, self)
    board[7][5] = Bishop.new(player_two_color, self)

    board[0][3] = Queen.new(player_one_color, self)
    board[7][3] = Queen.new(player_two_color, self)

    board[0][4] = King.new(player_one_color, self)
    board[7][4] = King.new(player_two_color, self)
  end

  def in_bounds?(pos)
    pos.first.between?(0,7) && pos.last.between?(0,7)
  end

  def move(start, end_point)

      if valid_move?(start,end_point)
        take_piece(start,end_point)
      else
        raise "Invalid Move!"
      end
  end

  def take_piece(start,end_point)
      board[end_point.first][end_point.last] = board[start.first][start.last]
      board[start.first][start.last] = Blank.new
  end

  def valid_move?(start, end_point)
    board[start.first][start.last].valid_move?(start,end_point) && board[start.first][start.last].check_path?(start,end_point)
  end

  def is_path_free?(start, end_pos)

  end

  def deep_dup
    dup = self.dup
    dup.board.each_with_index do |row,idx1|
      row.each_with_index do |col,idx2|
        dup.board[idx1][idx2] = board[idx1][idx2].dup
      end
    end
    dup
  end

end
