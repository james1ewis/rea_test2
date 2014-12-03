module ReaTest
  module Domain

    class Placer
      def initialize(**args)
        @table = args.fetch(:table, Table.new)
      end

      def place(placeable, position)
        placeable.position = position unless @table.out_of_bounds? position
      end
    end

  end
end
