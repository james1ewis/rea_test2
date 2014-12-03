require_relative '../../../support/spec_helper'

describe ReaTest::UserInterface::Commands::CommandFactory do

  describe '#create' do

    before :each do
      simulator = double('Simulator')
      @command_factory = ReaTest::UserInterface::Commands::CommandFactory.new simulator: simulator
    end

    it 'creates a place command' do
      command = @command_factory.create(:place, { position: ReaTest::Domain::Position.new(1, 2, :north) })
      expect(command).to be_a(ReaTest::UserInterface::Commands::PlaceCommand)
    end

    it 'creates a report command' do
      command = @command_factory.create(:report)
      expect(command).to be_a(ReaTest::UserInterface::Commands::ReportCommand)
    end

    it 'creates a move command' do
      command = @command_factory.create(:move)
      expect(command).to be_a(ReaTest::UserInterface::Commands::MoveCommand)
    end

    it 'creates a left command' do
      command = @command_factory.create(:left)
      expect(command).to be_a(ReaTest::UserInterface::Commands::LeftCommand)
    end

    it 'creates a right command' do
      command = @command_factory.create(:right)
      expect(command).to be_a(ReaTest::UserInterface::Commands::RightCommand)
    end

  end

end
