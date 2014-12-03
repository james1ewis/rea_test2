require_relative 'command_executor'

module ReaTest
  module UserInterface

    class MainMenu
      def initialize(**args)
        @stdout = args.fetch(:stdout, $stdout)
        @stdin = args.fetch(:stdin, $stdin)
        @command_executor = args.fetch(:command_executor, CommandExecutor.new)
      end

      def run
        display_main_menu
        display_command_loop
      end

      private

      def display_main_menu
        output 'Enter EXIT to exit at anytime'
        output 'Enter START to start the simulator'
        read_input
      end

      def display_command_loop
        until exit?
          output 'Enter Command: '
          read_input

          break if exit?

          @command_executor.execute(@user_input)
        end
      end

      def exit?
        @user_input == 'EXIT'
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
