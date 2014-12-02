module ReaTest
  module Domain

    class Position
      attr_reader :x, :y, :heading

      def initialize(x, y, heading)
        @x, @y, @heading = x, y, heading
      end

      def to_s
        "#{@x},#{@y},#{@heading.to_s.upcase}"
      end

      def ==(other)
        return true if @x == other.x && @y == other.y && @heading == other.heading
      end
    end

  end
end
