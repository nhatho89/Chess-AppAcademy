class Piece
  attr_reader :name, :color
  attr_accessor :pos

  def initialize(color, pos)
    # @name = name
    @color = color
    @current_position = pos
  end

  def moves
    #all possible places a piece can move
  end



end
