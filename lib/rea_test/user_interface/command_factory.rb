module ReaTest
  module UserInterface

    class CommandFactory
      def initialize(**args)
        @simulator = args.fetch(:simulator, ReaTest::Domain::Simulator.new)
      end

      def create(type, **parameters)
        PlaceCommand.new position: parameters[:position]
      end
    end

  end
end