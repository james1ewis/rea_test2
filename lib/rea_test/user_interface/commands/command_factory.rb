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
        end

        def create(type, **parameters)
          case type
          when :place then PlaceCommand.new simulator: @simulator, position: parameters[:position]
          when :report then ReportCommand.new simulator: @simulator
          when :move then MoveCommand.new simulator: @simulator
          when :left then LeftCommand.new simulator: @simulator
          when :right then RightCommand.new simulator: @simulator
          end
        end
      end

    end
  end
end
