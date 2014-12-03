require_relative '../../support/spec_helper'

describe ReaTest::UserInterface::Parser do

  describe '#parse' do

    it 'parses a report command' do
      command_factory = double('CommandFactory')

      expect(command_factory).to receive(:create).with(:report, an_instance_of(Hash))

      parser = ReaTest::UserInterface::Parser.new command_factory: command_factory
      parser.parse('REPORT')
    end

    it 'parses a place command' do
      command_factory = double('CommandFactory')
      parameters = { position: ReaTest::Domain::Position.new(1, 2, :north) }

      expect(command_factory).to receive(:create).with(:report, parameters)

      parser = ReaTest::UserInterface::Parser.new command_factory: command_factory
      parser.parse('PLACE 1,2,NORTH')
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
