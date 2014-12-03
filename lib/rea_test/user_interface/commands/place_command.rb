require 'observer'

module ReaTest
  module UserInterface
    module Commands

      class PlaceCommand
        include Observable

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
