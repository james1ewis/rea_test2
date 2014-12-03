require_relative '../../../support/spec_helper'

describe ReaTest::UserInterface::Commands::MoveCommand do

  describe '#execute' do

    it 'calls move on the simulator' do
      calls_simulator_with_expected_message command: ReaTest::UserInterface::Commands::MoveCommand,
                                            message: :move
    end

  end

end
