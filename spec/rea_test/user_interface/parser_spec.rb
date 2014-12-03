require_relative '../../support/spec_helper'

describe ReaTest::UserInterface::Parser do

  describe '#parse' do

    it 'parses a report command' do
      command_factory = double('CommandFactory')

      parser = ReaTest::UserInterface::Parser.new command_factory: command_factory
      command = parser.parse('REPORT')

      expect(command_factory).to receive(:create).with(:report, { })
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

    it 'parses a move command' do
      parser = ReaTest::UserInterface::Parser.new
      command = parser.parse('MOVE')

      expect(command).to be_a(ReaTest::UserInterface::Command)
      expect(command.type).to eq(:move)
      expect(command.parameters).to be_nil
    end

    it 'parses a left command' do
      parser = ReaTest::UserInterface::Parser.new
      command = parser.parse('LEFT')

      expect(command).to be_a(ReaTest::UserInterface::Command)
      expect(command.type).to eq(:left)
      expect(command.parameters).to be_nil
    end

  end

end
