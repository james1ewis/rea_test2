require 'observer'

module ReaTest
  module UserInterface
    module Commands

    class MoveCommand
      include Observable

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
