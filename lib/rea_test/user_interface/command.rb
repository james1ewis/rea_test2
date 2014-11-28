module ReaTest
  module UserInterface

    class Command
      attr_reader :type, :parameters

      def initialize(**args)
        @type = args.fetch(:type)
        @parameters = args.fetch(:parameters, nil)
      end
    end

  end
end
