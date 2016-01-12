require_relative 'Piece'
require_relative 'SteppingMove'

class Knight < Piece
  include SteppingMove
  attr_reader :color, :symbol

  def initialize(color)
    super(color)
    @symbol = " ♘ "
  end

  def valid_move?(start,end_pos)
    knight_valid_move?(start,end_pos)
  end


end
