module ReaTest
  module UserInterface

    class LeftCommand
      def initialize(**args)
        @simulator = args.fetch(:simulator)
      end

      def execute
        @simulator.left
      end
    end

  end
end
