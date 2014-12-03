module ReaTest
  module Domain

    class Rotater
      def initialize
        @headings = [:north, :east, :south, :west]
      end

      def rotate_left(rotateable)
        current_position = rotateable.position

        current_heading = @headings.find_index(current_position.heading)

        current_heading == 0 ? current_heading = 3 : current_heading -= 1

        rotateable.position = Position.new(current_position.x, current_position.y, @headings[current_heading])
      end

      def rotate_right(rotateable)
        current_position = rotateable.position

        current_heading = @headings.find_index(current_position.heading)

        current_heading == 3 ? current_heading = 0 : current_heading += 1

        rotateable.position = Position.new(current_position.x, current_position.y, @headings[current_heading])
      end
    end

  end
end