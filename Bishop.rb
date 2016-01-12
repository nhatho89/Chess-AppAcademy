require_relative 'Piece'
require_relative 'SlidingMove'

class Bishop < Piece
  include SlidingMove

  attr_reader :color, :symbol

  def initialize(color)
    super(color)
    @symbol = " ♗ "
  end

  def valid_move?(start, ending)
    diagonal_valid_move?(start, ending)
  end

end
