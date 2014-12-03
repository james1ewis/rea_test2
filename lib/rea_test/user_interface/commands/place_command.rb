require_relative 'command'

module ReaTest
  module UserInterface
    module Commands

      class PlaceCommand < Command

        def initialize(**args)
          @simulator = args.fetch(:simulator)
          @position = args.fetch(:position)
        end

        def execute
          @simulator.place(@position)
        end
      end

    end
  end
end
