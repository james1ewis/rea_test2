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

        rotateable.position = Position.new(current_position.x, current_position.y, @headings[next_heading])
      end
    end

  end
end
