module ReaTest
  module Domain
    class Position
      attr_reader :x, :y, :heading

      def initialize(x, y, heading)
        @x, @y, @heading = x, y, heading
      end
    end
  end
end
