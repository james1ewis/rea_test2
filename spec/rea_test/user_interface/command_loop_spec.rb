require_relative '../../support/spec_helper'

describe ReaTest::UserInterface::CommandLoop do

  describe '#start' do

    it 'executes commands' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')
      command_executor = double('CommandExecutor')

      expect(fake_stdout).to receive(:puts).twice.with('Enter Command: ')
      expect(fake_stdin).to receive(:gets) { "MOVE\n" }
      expect(command_executor).to receive(:execute).with('MOVE')
      expect(fake_stdin).to receive(:gets) { "EXIT\n" }

      command_loop = ReaTest::UserInterface::CommandLoop.new stdout: fake_stdout,
                                                             stdin: fake_stdin,
                                                             command_executor: command_executor

      command_loop.start
    end

  end

end
