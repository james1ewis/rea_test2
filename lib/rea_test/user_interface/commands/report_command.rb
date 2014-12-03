require 'observer'

module ReaTest
  module UserInterface
    module Commands

      class ReportCommand
        include Observable

        def initialize(**args)
          @stdout = args.fetch(:stdout, $stdout)
          @simulator = args.fetch(:simulator)
        end

        def execute
          changed
          notify_observers(@simulator.report)
        end
      end

    end
  end
end
