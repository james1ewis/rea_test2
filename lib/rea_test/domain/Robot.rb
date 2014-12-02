require_relative 'placeable'
require_relative 'moveable'
require_relative 'table'

module ReaTest
  module Domain

    class Robot
      include(ReaTest::Domain::Placeable)
      include(ReaTest::Domain::Moveable)

      attr_reader :position

      def initialize(**args)
        @table = args.fetch(:table, Table.new)
      end

      protected

      # there is obviously a problem here...
      def out_of_bounds?(position)
        @table.out_of_bounds? position
      end

      def position=(position)
        @position = position
      end
    end

  end
end
