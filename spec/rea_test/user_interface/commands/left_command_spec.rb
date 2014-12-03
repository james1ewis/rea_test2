require_relative '../../../support/spec_helper'

describe ReaTest::UserInterface::Commands::LeftCommand do

  describe '#execute' do

    it 'calls left on the simulator' do
      calls_simulator_with_expected_message command: ReaTest::UserInterface::Commands::LeftCommand,
                                            message: :left
    end

  end

end
