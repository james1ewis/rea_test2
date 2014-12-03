require_relative 'command_loop'

module ReaTest
  module UserInterface

    class MainMenu
      def initialize(**args)
        @stdout = args.fetch(:stdout, $stdout)
        @stdin = args.fetch(:stdin, $stdin)
        @command_loop = args.fetch(:command_loop, CommandLoop.new)
      end

      def run
        display_main_menu

        @command_loop.run unless @user_input == 'EXIT'
      end

      private

      def display_main_menu
        output 'Enter EXIT to exit at anytime'
        output 'Enter START to start the simulator'
        read_input
      end

      def output(text)
        @stdout.puts text
      end

      def read_input
        @user_input = @stdin.gets.chomp
      end
    end

  end
end
