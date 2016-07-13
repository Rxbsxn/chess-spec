require 'support/transform_position'

describe Support::TransformPosition do
  before do
    class ChessPieceDouble
      include Support::TransformPosition
    end
  end
  let(:transform_position) { ChessPieceDouble.new }

  pending '#to_coordinate', '(from position "ay")'
  pending '#to_position', '(from coordinate [x,y])'
end
