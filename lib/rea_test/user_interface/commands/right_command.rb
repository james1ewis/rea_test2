require 'observer'

module ReaTest
  module UserInterface
    module Commands

      class RightCommand
        include Observable

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
