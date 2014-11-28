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
        user_input = @stdin.gets.chomp

        until user_input == 'EXIT'
          @stdout.puts 'Enter Command: '
          user_input = @stdin.gets.chomp
          @parser.parse(user_input) unless user_input == 'EXIT'
        end

      end
    end

  end
end
