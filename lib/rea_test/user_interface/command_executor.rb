require_relative 'parser'
require_relative '../domain/simulator'

module ReaTest
  module UserInterface

    class CommandExecutor
      def initialize(**args)
        @parser = args.fetch(:parser, Parser.new)
        @simulator = args.fetch(:simulator, Domain::Simulator.new)
      end

      def execute(command_text)
        command = @parser.parse(command_text)

        case command.type
        when :place then @simulator.place(command.parameters[:position])
        when :report then puts @simulator.report
        when :move then @simulator.move
        end
      end
    end

  end
end
