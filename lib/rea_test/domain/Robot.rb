require_relative 'moveable'
require_relative 'table'

module ReaTest
  module Domain

    class Robot
      include(ReaTest::Domain::Moveable)

      attr_reader :position

      def initialize(**args)
        @table = args.fetch(:table, Table.new)
        @placer = args.fetch(:placer, nil)
      end

      def place(position)
        @placer.place(self, position)
      end

      protected

      # there is obviously a problem here... robot probably shouldn't know about a table - it
      # is just responsible for robot things...

      # this is what we want:
        # mover.move(self)
        # rotater.rotate_right(self)
        # rotater.rotate_left(self)
        # placer.place(self)

      def out_of_bounds?(position)
        @table.out_of_bounds? position
      end

      def position=(position)
        @position = position
      end
    end

  end
end
