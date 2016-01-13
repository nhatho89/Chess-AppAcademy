require_relative 'Piece'
require_relative 'SteppingMove'
class King < Piece
  include SteppingMove
  attr_reader :color, :symbol

  def initialize(color)
    super(color, board)
    @symbol = " ♔ "
    @board = board.deep_dup
  end

  def valid_move?(start,end_pos)
    king_valid_move?(start,end_pos)
  end

end
