class Piece
  attr_reader :name, :color
  attr_accessor :pos

  def initialize(color, board)
    # @name = name
    @color = color
    @board = board
    # @current_position = pos
  end

  def moves
    #all possible places a piece can move
  end



end
