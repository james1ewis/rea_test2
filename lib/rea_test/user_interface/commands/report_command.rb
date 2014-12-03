module ReaTest
  module UserInterface

    class ReportCommand
      def initialize(**args)
        @stdout = args.fetch(:stdout, $stdout)
        @simulator = args.fetch(:simulator)
      end

      def execute
        @stdout.puts @simulator.report
      end
    end

  end
end
