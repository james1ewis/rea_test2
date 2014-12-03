require_relative '../user_interface/command'
require_relative '../domain/position'

module ReaTest
  module UserInterface

    class Parser
      def initialize(**args)
        @command_factory = args.fetch(:command_factory, nil)
      end

      def parse(text)
        tokens = text.split(/\s/)
        type = tokens[0].downcase.to_sym
        position = get_position_from(tokens[1]) unless tokens.count == 1



        case type
        when :report then @command_factory.create(type, { })
        when 'PLACE' then Command.new type: :place,
                                      parameters: { position: position }
        when 'MOVE' then Command.new type: :move
        when 'LEFT' then Command.new type: :left
        when 'RIGHT' then Command.new type: :right
        end
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
