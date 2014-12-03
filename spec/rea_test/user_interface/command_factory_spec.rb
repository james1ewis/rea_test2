require_relative '../../support/spec_helper'

describe ReaTest::UserInterface::CommandFactory do

  describe '#create' do

    it 'creates a place command' do
      simulator = double('Simulator')
      command_factory = ReaTest::UserInterface::CommandFactory.new simulator: simulator

      command = command_factory.create(:place, { position: ReaTest::Domain::Position.new(1, 2, :north) })

      expect(command).to be_a(ReaTest::UserInterface::PlaceCommand)
    end

  end

end
