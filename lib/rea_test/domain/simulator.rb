require_relative 'Robot'

module ReaTest
  module Domain

    class Simulator
      def initialize(**args)
        @robot = args.fetch(:robot, Robot.new)
      end

      def execute(command)

        @robot.place(command.parameters[:position]) if command.type == :place
        @robot.report if command.type == :report
      end
    end

  end
end
