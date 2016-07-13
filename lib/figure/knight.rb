require 'figure/base'

module Figure
  class Knight < Base
    private

    def range
      (1..1)
    end

    def directions
      [[-2, -1], [-2, +1], [-1, -2], [-1, +2], [+1, -2], [+1, +2], [+2, -1], [+2, +1]].flatten
    end
  end
end
