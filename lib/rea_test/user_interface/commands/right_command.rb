require_relative 'command'

module ReaTest
  module UserInterface
    module Commands

      class RightCommand < Command

        def initialize(**args)
          @simulator = args.fetch(:simulator)
        end

        def execute
          @simulator.right
        end
      end

    end
  end
end
