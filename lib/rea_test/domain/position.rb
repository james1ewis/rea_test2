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
    end
  end
end
