module ReaTest
  module UserInterface

    class PlaceCommand
      def initialize(**args)
        @position = args.fetch(:position, nil)
      end
    end

  end
end
