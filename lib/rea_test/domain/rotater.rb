module ReaTest
  module Domain

    class Rotater
      def initialize
        @headings = [:north, :east, :south, :west]
      end

      def rotate(rotateable)
        current_position = rotateable.position

        current_heading = @headings.find_index(current_position.heading)

        next_heading = get_next_heading(current_heading)

        rotateable.position = Position.new(current_position.x, current_position.y, @headings[current_heading])
      end
    end

    class LeftRotater < Rotater
      def get_next_heading(current_heading)
        current_heading == 0 ? current_heading = 3 : current_heading -= 1
      end
    end

    class RightRotater < Rotater
      def get_next_heading(current_heading)
        current_heading == 3 ? current_heading = 0 : current_heading += 1
      end
    end

  end
end