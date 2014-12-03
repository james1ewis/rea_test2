module ReaTest
  module UserInterface

    class CommandFactory
      def initialize(**args)
        @simulator = args.fetch(:simulator, ReaTest::Domain::Simulator.new)
      end

      def create(type, **parameters)
        case type
        when :place then PlaceCommand.new position: parameters[:position]
        when :report then ReportCommand.new
        when :move then MoveCommand.new
        when :left then LeftCommand.new
        when :right then RightCommand.new
        end
      end
    end

  end
end
