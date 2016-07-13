require 'support/transform_position'
require 'support/vectors'
module Figure
  class Base
    attr_reader :color
    attr_accessor :x, :y

    include Support::TransformPosition
    include Support::Vectors

    def initialize(position, color = 'white')
      @x, @y = position
      @color = color
    end

    def moves
      calculate_vectors.map { |vector_x, vector_y| [x + vector_x, y + vector_y] }
    end

    private

    def calculate_vectors
      range.flat_map { |distance| directions.map { |direction| direction * distance }.each_slice(2).to_a }
    end
  end
end
