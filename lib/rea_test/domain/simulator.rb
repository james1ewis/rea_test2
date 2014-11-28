module ReaTest
  module Domain

    class Simulator
      def initialize(**args)
        @robot = args.fetch(:robot, nil)
      end

      def execute(command)

      end
    end

  end
end
