require_relative 'SlidingMove'
require_relative 'Piece'
class Rook < Piece
  include SlidingMove
  attr_reader :color, :symbol

  def initialize(color)
    super(color)
    @symbol = " ♖ "
  end

  def valid_move?(start, ending)
    axis_valid_move?(start, ending)
  end

end
