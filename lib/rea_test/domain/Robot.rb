require_relative 'table'

module ReaTest
  module Domain

    class Robot
      attr_reader :position

      def initialize(**args)
        @table = args.fetch(:table, Table.new)
      end

      def place(position)
        @position = position unless @table.out_of_bounds? position
      end

      def move
        case @position.heading
        when :north then @position = Position.new(@position.x, @position.y + 1, @position.heading)
        when :south then @position = Position.new(@position.x, @position.y - 1, @position.heading)
        end
      end
    end

  end
end
