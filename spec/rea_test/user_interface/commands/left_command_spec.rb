require_relative '../../../support/spec_helper'

describe ReaTest::UserInterface::Commands::LeftCommand do

  describe '#execute' do

    it 'calls left on the simulator' do
      simulator = double('Simulator')

      expect(simulator).to receive(:left)

      left = ReaTest::UserInterface::Commands::LeftCommand.new simulator: simulator
      left.execute
    end

  end

end
