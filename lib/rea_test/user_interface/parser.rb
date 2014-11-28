require_relative '../domain/command'
require_relative '../domain/position'

module ReaTest
  module UserInterface

    class Parser
      def parse(text)
        return Domain::Command.new type: :report if text == 'REPORT'
      else return Domain::Command.new type: :place,
                                      parameters: { position: Domain::Position.new(1,2,:north) }
      end
    end

  end
end
