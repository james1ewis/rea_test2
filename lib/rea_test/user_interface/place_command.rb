module ReaTest
  module UserInterface

    class PlaceCommand
      def initialize(**args)
        @simulator = args.fetch(:simulator)
        @position = args.fetch(:position, nil)
      end

      def execute
        @simulator.place(@position)
      end
    end

  end
end
