require_relative 'SlidingMove'
require_relative 'Piece'
require 'byebug'
class Rook < Piece
  include SlidingMove
  attr_reader :color, :symbol, :board

  def initialize(color,board)
    super(color, board)
    @symbol = " ♖ "
    @board = board.deep_dup
  end

  def valid_move?(start, ending)
    axis_valid_move?(start, ending)
  end

  def path(start, end_pos)
    axis_path(start, end_pos)
  end

  def check_path?(start, end_pos)
    #check each element of that range on board[i][j] if it is empty
    #if no then return false
    #else return true
    arr = generate_path(start, end_pos)
    arr.each do |pos|
      return false unless board[pos.first][pos.last].is_a?(Blank)
    end
    true
  end

  def generate_path(start,end_pos)
    arr = axis_move_pool(start)
    idx_start = arr.index(start)

    left = arr.take(idx_start+1)
    right = arr.drop(idx_start)

    if left.include?(end_pos)
      idx_end = left.index(end_pos)
      left = left.drop(idx_end)
      left.reverse!.shift
      left

    else
      idx_end = right.index(end_pos)
      right = right.take(idx_end+1)
      right.shift
      right
    end

  end

end
