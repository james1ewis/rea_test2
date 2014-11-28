module ReaTest
  module Domain

    class Robot
      attr_reader :position

      def place(position)
        @position = position
      end
    end

  end
end
