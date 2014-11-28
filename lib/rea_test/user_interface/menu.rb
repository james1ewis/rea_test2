require_relative 'parser'

module ReaTest
  module UserInterface

    class Menu
      def initialize(**args)
        @stdout = args.fetch(:stdout, $stdout)
        @stdin = args.fetch(:stdin, $stdin)
        @parser = args.fetch(:parser, Parser.new)
      end

      def run
        @stdout.puts 'Enter EXIT to exit at anytime'
        @stdout.puts 'Enter START to start the simulator'
        command = @stdin.gets.chomp

        until command == 'EXIT'
          @stdout.puts 'Enter Command: '
          command = @stdin.gets.chomp
          @parser.parse(command)
        end

      end
    end

  end
end
