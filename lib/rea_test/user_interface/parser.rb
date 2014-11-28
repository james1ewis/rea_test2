require_relative '../domain/command'

module ReaTest
  module UserInterface

    class Parser
      def parse(text)
        return Domain::Command.new type: :report if text == 'REPORT'
      end
    end

  end
end
