module ReaTest
  module Domain

    class Mover
      def move(moveable)
        moveable.position = get_next_position_from(moveable.position)
      end

      private

      def get_next_position_from(position)
        case position.heading
        when :north then Position.new(position.x, position.y + 1, position.heading)
        when :south then Position.new(position.x, position.y - 1, position.heading)
        when :east then Position.new(position.x + 1, position.y, position.heading)
        when :west then Position.new(position.x - 1, position.y, position.heading)
        end
      end
    end

  end
end
