module ReaTest
  module UserInterface

    class ReportCommand
      def initialize(**args)
        @simulator = args.fetch(:simulator)
      end

      def execute
        @simulator.report
      end
    end

  end
end
