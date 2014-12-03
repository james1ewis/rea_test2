require_relative '../../../support/spec_helper'

describe ReaTest::UserInterface::Commands::ReportCommand do

  describe '#execute' do

    it 'calls report on the simulator' do
      calls_simulator_with_expected_message command: ReaTest::UserInterface::Commands::ReportCommand,
                                            message: :report
    end

  end

end
