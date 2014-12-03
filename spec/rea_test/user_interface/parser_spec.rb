require_relative '../../support/spec_helper'

describe ReaTest::UserInterface::Parser do

  describe '#parse' do

    it 'parses a report command' do
      parser = create_with_expectations do |command_factory|
        expect(command_factory).to receive(:create).with(:report, an_instance_of(Hash))
      end

      parser.parse('REPORT')
    end

    it 'parses a place command' do
      parser = create_with_expectations do |command_factory|
        parameters = { position: ReaTest::Domain::Position.new(1, 2, :north) }
        expect(command_factory).to receive(:create).with(:place, parameters)
      end

      parser.parse('PLACE 1,2,NORTH')
    end

    it 'parses a move command' do
      parser = create_with_expectations do |command_factory|
        expect(command_factory).to receive(:create).with(:move, an_instance_of(Hash))
      end

      parser.parse('MOVE')
    end

    it 'parses a left command' do
      parser = create_with_expectations do |command_factory|
        expect(command_factory).to receive(:create).with(:left, an_instance_of(Hash))
      end

      parser.parse('LEFT')
    end

    it 'parses a right command' do
      parser = create_with_expectations do |command_factory|
        expect(command_factory).to receive(:create).with(:right, an_instance_of(Hash))
      end

      parser.parse('RIGHT')
    end

  end

end
