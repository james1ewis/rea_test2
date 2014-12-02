require_relative 'command_loop'

module ReaTest
  module UserInterface

    class MainMenu
      def initialize(**args)
        @stdout = args.fetch(:stdout, $stdout)
        @stdin = args.fetch(:stdin, $stdin)
        @command_loop = args.fetch(:command_loop, CommandLoop.new)
      end

      def display
        @stdout.puts 'Enter EXIT to exit at anytime'
        @stdout.puts 'Enter START to start the simulator'
        user_input = @stdin.gets.chomp

        @command_loop.display unless user_input == 'EXIT'
      end
    end

  end
end
