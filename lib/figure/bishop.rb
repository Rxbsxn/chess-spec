require 'figure/base'

module Figure
  class Bishop < Base
    private

    def range
      (1..7)
    end

    def directions
      [N_WEST_S_EAST, N_EAST_S_WEST].flatten
    end
  end
end
