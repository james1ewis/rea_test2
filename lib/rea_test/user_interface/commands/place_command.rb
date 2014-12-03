require_relative 'command'

module ReaTest
  module UserInterface
    module Commands

      class PlaceCommand < Command

        def initialize(**args)
          @simulator = args.fetch(:simulator)
          @parameters = args.fetch(:parameters)
        end

        def execute
          @simulator.place(@parameters[:position])
        end
      end

    end
  end
end
