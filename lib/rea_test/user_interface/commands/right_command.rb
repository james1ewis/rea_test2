module ReaTest
  module UserInterface

    class RightCommand
      def initialize(**args)
        @simulator = args.fetch(:simulator)
      end

      def execute
        @simulator.right
      end
    end

  end
end
