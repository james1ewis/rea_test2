module ReaTest
  module UserInterface

    class RightCommand
      def initialize(**args)
        @simulator = args.fetch(:simulator)
      end


    end

  end
end
