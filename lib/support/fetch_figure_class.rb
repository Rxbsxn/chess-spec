require 'chess_piece_move'
require 'figure/knight'
require 'figure/pawn'
require 'figure/king'
require 'figure/bishop'
require 'figure/queen'
require 'figure/rook'

module Support
  module FetchFigureClass
    def figure_move_class
      Object.const_get('Figure').const_get(ARGV[1])
    end
  end
end
