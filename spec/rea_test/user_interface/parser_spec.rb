require_relative '../../support/spec_helper'

describe ReaTest::UserInterface::Parser do

  describe '#parse' do

    it 'parses a report command' do
      parser = ReaTest::UserInterface::Parser.new
      command = parser.parse('REPORT')

      expect(command).to be_a(ReaTest::UserInterface::Command)
      expect(command.type).to eq(:report)
      expect(command.parameters).to be_nil
    end

    it 'parses a place command' do
      parser = ReaTest::UserInterface::Parser.new
      command = parser.parse('PLACE 1,2,NORTH')

      expect(command).to be_a(ReaTest::UserInterface::Command)
      expect(command.type).to eq(:place)
      expect(command.parameters).to be_a(Hash)
      expect(command.parameters.count).to eq(1)
      expect(command.parameters[:position]).to be_a(ReaTest::Domain::Position)
      expect(command.parameters[:position].x).to eq(1)
      expect(command.parameters[:position].y).to eq(2)
      expect(command.parameters[:position].heading).to eq(:north)
    end

  end

end
