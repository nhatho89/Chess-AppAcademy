require_relative "SlidingMove"
require_relative 'Piece'
class Queen < Piece
   include SlidingMove
  attr_reader :color, :symbol, :board

  def initialize(color,board)
    super(color, board)
    @symbol = " ♕ "
    @board = board.deep_dup
  end

  def valid_move?(start, ending)
    axis_valid_move?(start, ending) || diagonal_valid_move?(start, ending)
  end

  def path(start, end_pos)
    diagonal_path(start, end_pos)
  end

end
