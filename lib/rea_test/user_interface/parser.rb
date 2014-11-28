require_relative '../user_interface/command'
require_relative '../domain/position'

module ReaTest
  module UserInterface

    class Parser
      def parse(text)

        tokens = text.split(/\s/)
        type = tokens[0]
        position = get_position_from(tokens[1]) unless tokens.count == 1

        case type
        when 'REPORT' then Command.new type: :report
        when 'PLACE' then Command.new type: :place,
                                      parameters: { position: position }
        when 'MOVE' then Command.new type: :move
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
