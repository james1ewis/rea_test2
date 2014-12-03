module ReaTest
  module UserInterface

    class MoveCommand
      def initialize(**args)
        @simulator = args.fetch(:simulator)
      end


    end

  end
end
