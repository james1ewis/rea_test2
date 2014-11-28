module ReaTest
  module Domain

    class Robot
      def place(position)
        @position = position
      end

      def report
        @position
      end
    end

  end
end
