require_relative '../../support/spec_helper'

describe ReaTest::UserInterface::Parser do

  describe '#parse' do

    it 'parses a report command' do
      parser = ReaTest::UserInterface::Parser.new
      command = parser.parse('REPORT')

      expect(command).to be_a(ReaTest::Domain::Command)
      expect(command.type).to eq(:report)
      expect(command.parameters).to be_nil
    end

  end

end
