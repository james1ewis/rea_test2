module ReaTest
  module UserInterface

    class ReportCommand
      def initialize(**args)
        @simulator = args.fetch(:simulator)
      end


    end

  end
end
