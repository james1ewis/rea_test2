require_relative 'parser'
require_relative '../domain/simulator'

module ReaTest
  module UserInterface

    class Menu
      def initialize(**args)
        @stdout = args.fetch(:stdout, $stdout)
        @stdin = args.fetch(:stdin, $stdin)
        @command_loop = args.fetch(:command_loop)
      end

      def run
        @stdout.puts 'Enter EXIT to exit at anytime'
        @stdout.puts 'Enter START to start the simulator'
        user_input = @stdin.gets.chomp

        @command_loop.start unless user_input =~ /EXIT/
      end
    end

  end
end
