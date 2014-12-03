module ReaTest
  module Domain

    class Mover
      def initialize(**args)
        @table = args.fetch(:table, Table.new)
      end

      def move(moveable)
        current_position = moveable.position
        new_position = get_next_position_from(current_position)

        moveable.position = new_position unless @table.out_of_bounds? new_position
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
