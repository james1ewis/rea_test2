require_relative '../../support/spec_helper'

describe ReaTest::UserInterface::PlaceCommand do

  describe '#execute' do

    it 'calls place on the simulator' do
      simulator = double('Simulator')
      position = ReaTest::Domain::Position.new(1, 2, :north)

      expect(simulator).to receive(:place).with(position)

      place = ReaTest::UserInterface::PlaceCommand.new simulator: simulator, position: position
      place.execute
    end

  end

end
