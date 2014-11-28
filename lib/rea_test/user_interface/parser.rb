module ReaTest
  module UserInterface

    class Parser
      def parse(text)
        return ReaTest::Domain::Command.new type: :report if text == 'REPORT'
      end
    end

  end
end
