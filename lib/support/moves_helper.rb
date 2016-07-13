require 'support/vectors'

module Support
  module MovesHelper
    include Support::Vectors

    SCOPE = (1..8)
    DIRECTIONS = {
      NORTH: NORTH_SOUTH[0],
      SOUTH: NORTH_SOUTH[1],
      WEST: WEST_EAST[0],
      EAST: WEST_EAST[1],
      N_EAST: N_EAST_S_WEST[0],
      S_WEST: N_EAST_S_WEST[1],
      N_WEST: N_WEST_S_EAST[0],
      S_EAST: N_WEST_S_EAST[1]
    }.freeze
    def can_attack?(position, move)
      @chess_board[position].color != @chess_board[move].color
    end

    def valid_move?(move)
      @chess_board[move].nil?
    end

    def possible_moves(x, y)
      @chess_board[[x, y]].moves.select { |move| on_board?(move) && (valid_move?(move) || can_attack?([x, y], move)) }
    end

    def on_board?(move)
      SCOPE.cover?(move.first) && SCOPE.cover?(move.last)
    end

    def figure_coords_after_move(position, destination)
      if possible_moves(*position).include?(destination)
        @chess_board[destination] = @chess_board[position].tap { |figure| figure.x, figure.y = destination }
        @chess_board.delete(position)
        @chess_board[destination]
      else
        @chess_board[position]
      end
    end

    def add_vectors(a, b)
      [a.first + b.first, a.last + b.last]
    end

    def vector_from_offset(coord)
      coord > 0 ? coord / coord.abs : 0
    end

    def find_vector(position, destination)
      hsh = DIRECTIONS.select do |_key, val|
        [(destination.first - position.first),
         (destination.last - position.last)].map { |coord| vector_from_offset(coord) } == val
      end
      hsh.values.first
    end

    def collision_check?(position, destination)
      vector = find_vector(position, destination)
      coords = add_vectors(position, vector)
      add_vectors(coords, vector) while valid_move?(coords) && coords != destination
      can_attack?(position, coords) && coords == destination ? true : false
    end
  end
end
