require_relative 'Piece'
require_relative 'DiagonalMove'

class Bishop < Piece
  extend DiagonalMove

  attr_reader :color, :symbol

  def initialize(color)
    super(color)
    @symbol = " ♗ "
  end

  def move(start, end_point)
    if DiagonalMove.diagonal_valid?(start, end_point)
      @current_pos = end_point
    else
      raise "I can't go there"
    end
  end

end
