module ReaTest
  module Domain

    class Mover
      def initialize(**args)
        @table = args.fetch(:table, Table.new)
      end

      def move(moveable)
        
      end
    end

  end
end