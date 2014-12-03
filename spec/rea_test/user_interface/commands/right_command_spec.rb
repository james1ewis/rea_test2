require_relative '../../../support/spec_helper'

describe ReaTest::UserInterface::RightCommand do

  describe '#execute' do

    it 'calls right on the simulator' do
      simulator = double('Simulator')

      expect(simulator).to receive(:right)

      right = ReaTest::UserInterface::RightCommand.new simulator: simulator
      right.execute
    end

  end

end
