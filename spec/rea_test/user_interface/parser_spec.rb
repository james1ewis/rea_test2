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

      expect(command_factory).to receive(:create).with(:place, parameters)

      parser = ReaTest::UserInterface::Parser.new command_factory: command_factory
      parser.parse('PLACE 1,2,NORTH')
    end

    it 'parses a move command' do
      command_factory = double('CommandFactory')

      expect(command_factory).to receive(:create).with(:move, an_instance_of(Hash))

      parser = ReaTest::UserInterface::Parser.new command_factory: command_factory
      parser.parse('MOVE')
    end

    it 'parses a left command' do
      command_factory = double('CommandFactory')

      expect(command_factory).to receive(:create).with(:left, an_instance_of(Hash))

      parser = ReaTest::UserInterface::Parser.new command_factory: command_factory
      parser.parse('LEFT')
    end

    it 'parses a right command' do
      command_factory = double('CommandFactory')

      expect(command_factory).to receive(:create).with(:right, an_instance_of(Hash))

      parser = ReaTest::UserInterface::Parser.new command_factory: command_factory
      parser.parse('RIGHT')
    end

  end

end
