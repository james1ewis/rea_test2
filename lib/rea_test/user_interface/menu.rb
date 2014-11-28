require_relative 'parser'
require_relative '../domain/simulator'

module ReaTest
  module UserInterface

    class Menu
      def initialize(**args)
        @stdout = args.fetch(:stdout, $stdout)
        @stdin = args.fetch(:stdin, $stdin)
        @parser = args.fetch(:parser, Parser.new)
        @simulator = args.fetch(:simulator, Domain::Simulator.new)
      end

      def run
        @stdout.puts 'Enter EXIT to exit at anytime'
        @stdout.puts 'Enter START to start the simulator'
        user_input = @stdin.gets.chomp

        until user_input_exit? user_input
          @stdout.puts 'Enter Command: '
          user_input = @stdin.gets.chomp
          @simulator.execute(@parser.parse(user_input)) unless user_input_exit? user_input
        end

      end

      private
      
      def user_input_exit?(user_input)
        user_input == 'EXIT'
      end
    end

  end
end
