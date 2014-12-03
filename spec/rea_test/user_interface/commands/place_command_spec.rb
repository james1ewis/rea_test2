require_relative '../../../support/spec_helper'

describe ReaTest::UserInterface::Commands::PlaceCommand do

  describe '#execute' do

    it 'calls place on the simulator' do
      simulator = double('Simulator')
      position = ReaTest::Domain::Position.new(1, 2, :north)

      expect(simulator).to receive(:place).with(position)

      place = ReaTest::UserInterface::Commands::PlaceCommand.new simulator: simulator,
                                                                 parameters: { position: position }
      place.execute
    end

  end

end
