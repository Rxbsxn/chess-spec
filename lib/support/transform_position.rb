module Support
  module TransformPosition
    ASCII_OFFSET = 96
    def to_coordinate(position)
      [position[0].ord - ASCII_OFFSET, position[1].to_i]
    end

    def to_position(x, y)
      [(x + ASCII_OFFSET).chr, y.to_s].join
    end
  end
end
