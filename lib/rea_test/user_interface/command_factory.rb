module ReaTest
  module UserInterface

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
