require_relative 'Piece'
class Queen < Piece

  attr_reader :color, :symbol

  def initialize(color)
    super(color)
    @symbol = " ♕ "
  end

end
