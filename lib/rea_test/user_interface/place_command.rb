module ReaTest
  module UserInterface

    class PlaceCommand
      def initialize(**args)
        @simulator = args.fetch(:simulator)
        @position = args.fetch(:position, nil)
      end


    end

  end
end
