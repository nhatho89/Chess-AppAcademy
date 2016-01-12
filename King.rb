require_relative 'Piece'
class King < Piece

  attr_reader :color, :symbol

  def initialize(color)
    super(color)
    @symbol = " ♔ "
  end

end
