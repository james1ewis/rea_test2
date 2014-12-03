require_relative '../user_interface/commands/command_factory'
require_relative '../domain/position'

module ReaTest
  module UserInterface

    class Parser
      def initialize(**args)
        @command_factory = args.fetch(:command_factory, CommandFactory.new)
      end

      def parse(text)
        tokens = text.split(/\s/)
        type = tokens[0].downcase.to_sym
        position = get_position_from(tokens[1]) unless tokens.count == 1
        parameters = position.nil? ? { } : { position: position }

        @command_factory.create(type, parameters)
      end

      private

      def get_position_from(text)
        position_tokens = text.split(/,/)

        Domain::Position.new(position_tokens[0].to_i,
                             position_tokens[1].to_i,
                             position_tokens[2].to_s.downcase.to_sym)
      end
    end

  end
end
