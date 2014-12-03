require_relative '../../support/spec_helper'

describe ReaTest::UserInterface::ReportCommand do

  describe '#execute' do

    it 'calls report on the simulator' do
      simulator = double('Simulator')

      expect(simulator).to receive(:report)

      report = ReaTest::UserInterface::ReportCommand.new simulator: simulator
      report.execute
    end

  end

end