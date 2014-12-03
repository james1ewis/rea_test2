require_relative '../../../support/spec_helper'

describe ReaTest::UserInterface::Commands::RightCommand do

  describe '#execute' do

    it 'calls right on the simulator' do
      calls_simulator_with_expected_message command: ReaTest::UserInterface::Commands::RightCommand,
                                            message: :right
    end

  end

end
