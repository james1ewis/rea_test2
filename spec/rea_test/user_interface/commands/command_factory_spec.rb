require_relative '../../../support/spec_helper'

describe ReaTest::UserInterface::CommandFactory do

  describe '#create' do

    it 'creates a place command' do
      simulator = double('Simulator')
      command_factory = ReaTest::UserInterface::CommandFactory.new simulator: simulator

      command = command_factory.create(:place, { position: ReaTest::Domain::Position.new(1, 2, :north) })

      expect(command).to be_a(ReaTest::UserInterface::PlaceCommand)
    end

    it 'creates a report command' do
      simulator = double('Simulator')
      command_factory = ReaTest::UserInterface::CommandFactory.new simulator: simulator

      command = command_factory.create(:report)

      expect(command).to be_a(ReaTest::UserInterface::ReportCommand)
    end

    it 'creates a move command' do
      simulator = double('Simulator')
      command_factory = ReaTest::UserInterface::CommandFactory.new simulator: simulator

      command = command_factory.create(:move)

      expect(command).to be_a(ReaTest::UserInterface::MoveCommand)
    end

    it 'creates a left command' do
      simulator = double('Simulator')
      command_factory = ReaTest::UserInterface::CommandFactory.new simulator: simulator

      command = command_factory.create(:left)

      expect(command).to be_a(ReaTest::UserInterface::LeftCommand)
    end

    it 'creates a right command' do
      simulator = double('Simulator')
      command_factory = ReaTest::UserInterface::CommandFactory.new simulator: simulator

      command = command_factory.create(:right)

      expect(command).to be_a(ReaTest::UserInterface::RightCommand)
    end

  end

end
