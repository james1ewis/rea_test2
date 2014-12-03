module ReaTest
  module UserInterface

    class LeftCommand
      def initialize(**args)
        @simulator = args.fetch(:simulator)
      end


    end

  end
end
