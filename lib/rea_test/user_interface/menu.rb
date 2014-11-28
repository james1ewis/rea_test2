module ReaTest
  module UserInterface

    class Menu
      def initialize(**args)
        @stdout = args.fetch(:stdout, $stdout)
        @stdin = args.fetch(:stdin, $stdin)
      end

      def run
        @stdout.puts 'Enter EXIT to exit at anytime'
        @stdout.puts 'Enter START to start the simulator'
        command = @stdin.gets.chomp

        until command == 'EXIT'
          @stdout.puts 'Enter Command: '
          command = @stdin.gets.chomp
        end

      end
    end

  end
end
