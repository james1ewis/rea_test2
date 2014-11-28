require_relative '../../support/spec_helper'

describe ReaTest::UserInterface::CommandLoop do

  describe '#start' do

    it 'passes command to the simulator' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')
      parser = double('Parser')
      simulator = double('Simulator')

      expect(fake_stdout).to receive(:puts).twice.with('Enter Command: ')
      expect(fake_stdin).to receive(:gets) { "REPORT\n" }
      expect(parser).to receive(:parse).with('REPORT') { ReaTest::UserInterface::Command.new type: :report }
      expect(simulator).to receive(:report)
      expect(fake_stdin).to receive(:gets) { "EXIT\n" }

      command_loop = ReaTest::UserInterface::CommandLoop.new stdout: fake_stdout,
                                                             stdin: fake_stdin,
                                                             parser: parser,
                                                             simulator: simulator

      command_loop.start
    end

  end

end