module ReaTest
  module Domain

    class Robot
      attr_reader :position

      def place(position)
        @position = position
      end

      def report
        puts @position
      end
    end

  end
end
