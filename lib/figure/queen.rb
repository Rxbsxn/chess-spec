require 'figure/base'

module Figure
  class Queen < Base
    private

    def range
      (1..7)
    end

    def directions
      [NORTH_SOUTH, WEST_EAST, N_WEST_S_EAST, N_EAST_S_WEST].flatten
    end
  end
end
