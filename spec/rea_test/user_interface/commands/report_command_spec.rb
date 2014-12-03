require_relative '../../../support/spec_helper'

describe ReaTest::UserInterface::Commands::ReportCommand do

  describe '#execute' do

    it 'calls report on the simulator' do
      simulator = double('Simulator')

      expect(simulator).to receive(:report)

      report = ReaTest::UserInterface::Commands::ReportCommand.new simulator: simulator
      report.execute
    end

    it 'puts the result' do
      simulator = double('Simulator')
      stdout = double('$stdout')
      position = '1,2,NORTH'

      expect(simulator).to receive(:report) { position }
      expect(stdout).to receive(:puts).with(position)

      report = ReaTest::UserInterface::Commands::ReportCommand.new simulator: simulator, stdout: stdout
      report.execute
    end

  end

end
