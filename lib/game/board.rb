require 'figure/knight'
require 'figure/pawn'
require 'figure/king'
require 'figure/bishop'
require 'figure/queen'
require 'figure/rook'
require 'figure/base'
require 'support/moves_helper'
module Game
  class Board
    include Support::MovesHelper

    def initialize
      @chess_board = {}
      start_statement_white
      start_statement_black
    end

    def start_statement_white
      @chess_board[[1, 1]] = Figure::Rook.new([1, 1], 'white')
      @chess_board[[2, 1]] = Figure::Knight.new([2, 1], 'white')
      @chess_board[[3, 1]] = Figure::Bishop.new([3, 1], 'white')
      @chess_board[[4, 1]] = Figure::Queen.new([4, 1], 'white')
      @chess_board[[5, 1]] = Figure::King.new([5, 1], 'white')
      @chess_board[[6, 1]] = Figure::Bishop.new([6, 1], 'white')
      @chess_board[[7, 1]] = Figure::Knight.new([7, 1], 'white')
      @chess_board[[8, 1]] = Figure::Rook.new([8, 1], 'white')
      (1..8).each do |i|
        @chess_board[[i, 2]] = Figure::Pawn.new([i, 2], 'white')
      end
    end

    def start_statement_black
      @chess_board[[1, 8]] = Figure::Rook.new([1, 8], 'black')
      @chess_board[[2, 8]] = Figure::Knight.new([2, 8], 'black')
      @chess_board[[3, 8]] = Figure::Bishop.new([3, 8], 'black')
      @chess_board[[4, 8]] = Figure::Queen.new([4, 8], 'black')
      @chess_board[[5, 8]] = Figure::King.new([5, 8], 'black')
      @chess_board[[6, 8]] = Figure::Bishop.new([6, 8], 'black')
      @chess_board[[7, 8]] = Figure::Knight.new([7, 8], 'black')
      @chess_board[[8, 8]] = Figure::Rook.new([8, 8], 'black')
      (1..8).each do |i|
        @chess_board[[i, 7]] = Figure::Pawn.new([i, 7], 'black')
      end
    end

    def move_figure(position, destination)
      figure_coords_after_move(position, destination)
    end
  end
end
