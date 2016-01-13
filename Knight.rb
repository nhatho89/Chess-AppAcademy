require_relative 'Piece'
require_relative 'SteppingMove'

class Knight < Piece
  include SteppingMove
  attr_reader :color, :symbol, :board

  def initialize(color,board)
    super(color)
    @symbol = " ♘ "
    @board = board.deep_dup
  end

  def valid_move?(start,end_pos)
    knight_valid_move?(start,end_pos)
  end


end
