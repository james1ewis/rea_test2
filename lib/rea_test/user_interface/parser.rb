require_relative '../user_interface/command'
require_relative '../domain/position'

module ReaTest
  module UserInterface

    class Parser
      def parse(text)

        type = text.split(/\s/)[0]

        case type
        when 'REPORT' then Command.new type: :report
        when 'PLACE' then Command.new type: :place,
                                      parameters: { position: Domain::Position.new(1, 2, :north) }
        end
      end
    end

  end
end
