require_relative 'command'

module ReaTest
  module UserInterface
    module Commands

      class ReportCommand < Command

        def initialize(**args)
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
