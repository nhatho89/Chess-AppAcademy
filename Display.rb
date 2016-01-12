require_relative "Board.rb"
require 'colorize'
require_relative 'cursorable'
class Display
  include Cursorable
  attr_reader :board
  attr_accessor :cursor_pos
  def initialize(board)
    @board = board
    @cursor_pos = [0,0]
  end

  def render
    system "clear"
    board.board.each_with_index do |row,idx1|
      row.each_with_index do |el,idx2|
        if cursor_pos.first == idx1 && cursor_pos.last == idx2
          print board.board[cursor_pos.first][cursor_pos.last].symbol.colorize(:background => :red)
        elsif (idx1 + idx2).even?
          print el.colorize(:color => :blue, :background => :white)
        elsif (idx1 + idx2).odd?
          print el.colorize(:color => :yellow, :background => :magenta)
        end
      end
      print "\n"
    end
  end

  def cursor(start = nil, ending = nil)
    while start.nil?
      start = get_input
      render
    end

    while ending.nil?
      ending = get_input
      render
    end

     board.move(start,ending)
    render
  end

end
