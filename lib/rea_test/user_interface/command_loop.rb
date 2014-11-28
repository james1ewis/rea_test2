module ReaTest
  module UserInterface

    class CommandLoop
      def initialize(**args)
        @stdout = args.fetch(:stdout, $stdout)
        @stdin = args.fetch(:stdin, $stdin)
        @parser = args.fetch(:parser, Parser.new)
        @simulator = args.fetch(:simulator, Domain::Simulator.new)
      end

      def start
        user_input = ''

        until user_input_exit? user_input
          @stdout.puts 'Enter Command: '
          user_input = @stdin.gets.chomp

          break if user_input_exit? user_input

          command = @parser.parse(user_input)

          case command.type
          when :place then @simulator.place(command.parameters[:position])
          when :report then puts @simulator.report
          end
        end
      end

      private

      def user_input_exit?(user_input)
        user_input == 'EXIT'
      end
    end

  end
end