require_relative 'moveable'
require_relative 'table'

module ReaTest
  module Domain

    class Robot
      include(ReaTest::Domain::Moveable)

      attr_reader :position

      def initialize(**args)
        @table = args.fetch(:table, Table.new)
        @placer = args.fetch(:placer, Placer.new)
      end

      def place(position)
        @placer.place(self, position)
      end



      def position=(position)
        @position = position
      end

      protected

      def out_of_bounds?(position)
        @table.out_of_bounds? position
      end
    end

  end
end
