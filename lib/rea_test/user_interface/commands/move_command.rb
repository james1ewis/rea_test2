require_relative 'command'

module ReaTest
  module UserInterface
    module Commands

    class MoveCommand < Command

      def initialize(**args)
        @simulator = args.fetch(:simulator)
      end

      def execute
        @simulator.move
      end
    end

    end
  end
end
