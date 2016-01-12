class Bishop < Piece
  extend "DiagonalMove"

  def initialize
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
