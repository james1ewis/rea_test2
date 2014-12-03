module ReaTest
  module Domain

    class Rotater
      def initialize
        @headings = [:north, :east, :south, :west]
      end

      def rotate_left(rotateable)
        rotateable.position = rotate do |current_heading|
          current_heading == 0 ? current_heading = 3 : current_heading -= 1
        end
      end

      def rotate_right(rotateable)
        rotateable.position = rotate do |current_heading|
          current_heading == 3 ? current_heading = 0 : current_heading += 1
        end
      end

      private

      def rotate(&strategy)
        current_heading = @headings.find_index(self.position.heading)

        current_heading = strategy.call(current_heading)

        Position.new(self.position.x, self.position.y, @headings[current_heading])
      end
    end

  end
end