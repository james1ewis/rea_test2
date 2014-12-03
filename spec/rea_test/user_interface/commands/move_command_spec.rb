require_relative '../../../support/spec_helper'

describe ReaTest::UserInterface::Commands::MoveCommand do

  describe '#execute' do

    it 'calls move on the simulator' do
      simulator = double('Simulator')

      expect(simulator).to receive(:move)

      move = ReaTest::UserInterface::Commands::MoveCommand.new simulator: simulator
      move.execute
    end

  end

end
