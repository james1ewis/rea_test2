module ReaTest
  module UserInterface

    class CommandFactory
      def initialize(**args)
        @simulator = args.fetch(:simulator, ReaTest::Domain::Simulator.new)
      end

      def create(type, parameters)
        
      end
    end

  end
end