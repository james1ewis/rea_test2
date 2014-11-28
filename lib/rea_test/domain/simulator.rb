require_relative 'Robot'

module ReaTest
  module Domain

    class Simulator
      def initialize(**args)
        @robot = args.fetch(:robot, Robot.new)
      end

      def place(position)
        @robot.place(position)
      end

      def report
        @robot.position.to_s
      end

      def move
        @robot.move
      end
    end

  end
end
