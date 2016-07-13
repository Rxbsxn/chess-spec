require 'figure/base'

module Figure
  class Rook < Base
    private

    def range
      (1..7)
    end

    def directions
      [NORTH_SOUTH, WEST_EAST].flatten
    end
  end
end
