module ReaTest
  module UserInterface
    module Commands

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
end
