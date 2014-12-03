require_relative 'command_executor'

module ReaTest
  module UserInterface

    class CommandLoop
      def initialize(**args)
        @stdout = args.fetch(:stdout, $stdout)
        @stdin = args.fetch(:stdin, $stdin)
        @command_executor = args.fetch(:command_executor, CommandExecutor.new)
      end

      def run
        user_input = ''

        until user_input_exit? user_input
          @stdout.puts 'Enter Command: '
          user_input = @stdin.gets.chomp

          break if user_input_exit? user_input

          @command_executor.execute(user_input)
        end
      end

      private

      def user_input_exit?(user_input)
        user_input == 'EXIT'
      end
    end

  end
end
