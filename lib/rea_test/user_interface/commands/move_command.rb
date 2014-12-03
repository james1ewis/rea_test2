module ReaTest
  module UserInterface

    class MoveCommand
      def initialize(**args)
        @simulator = args.fetch(:simulator)
      end

      def execute
        @simulator.move
      end
    end

  end
end
