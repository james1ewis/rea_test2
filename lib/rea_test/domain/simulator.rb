module ReaTest
  module Domain

    class Simulator
      def initialize(**args)
        @robot = args.fetch(:robot, nil)
      end

      def execute(command)
        @robot.place(command.parameters[:position])
      end
    end

  end
end
