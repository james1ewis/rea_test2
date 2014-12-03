require_relative '../../domain/simulator'
require_relative 'place_command'
require_relative 'report_command'
require_relative 'move_command'
require_relative 'left_command'
require_relative 'right_command'

module ReaTest
  module UserInterface
    module Commands

      class CommandFactory
        def initialize(**args)
          @simulator = args.fetch(:simulator, ReaTest::Domain::Simulator.new)

          # could just load these dynamically....
          @commandMappings = { place: PlaceCommand,
                               report: ReportCommand,
                               move: MoveCommand,
                               left: LeftCommand,
                               right: RightCommand }
        end

        def create(type, **parameters)
          @commandMappings[type].new simulator: @simulator, parameters: parameters
        end
      end

    end
  end
end
