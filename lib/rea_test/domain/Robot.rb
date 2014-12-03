require_relative 'left_rotater'
require_relative 'right_rotater'
require_relative 'movers/move_factory'
require_relative 'table'

module ReaTest
  module Domain

    class Robot
      attr_reader :position

      def initialize(**args)
        @table = args.fetch(:table, Table.new)
        @move_factory = args.fetch(:move_factory, Movers::MoveFactory.new)
        @left_rotater = args.fetch(:left_rotater, LeftRotater.new)
        @right_rotater = args.fetch(:right_rotater, RightRotater.new)
      end

      def move
        mover = @move_factory.create(position.heading)
        mover.move(self)
      end

      def left
        @left_rotater.rotate(self)
      end

      def right
        @right_rotater.rotate(self)
      end

      def position=(position)
        @position = position unless @table.out_of_bounds? position
      end
    end

  end
end
