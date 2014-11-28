require_relative '../../support/spec_helper'

describe ReaTest::UserInterface::CommandLoop do

  describe '#start' do

    it 'passes report to the simulator' do
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

    it 'passes place to the simulator' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')
      parser = double('Parser')
      simulator = double('Simulator')

      expect(fake_stdout).to receive(:puts).twice.with('Enter Command: ')
      expect(fake_stdin).to receive(:gets) { "PLACE 1,2,NORTH\n" }
      expect(parser).to receive(:parse).with('PLACE 1,2,NORTH') { ReaTest::UserInterface::Command.new type: :place,
                        parameters: { position: ReaTest::Domain::Position.new(1, 2, :north) }}
      expect(simulator).to receive(:place)
      expect(fake_stdin).to receive(:gets) { "EXIT\n" }

      command_loop = ReaTest::UserInterface::CommandLoop.new stdout: fake_stdout,
                                                             stdin: fake_stdin,
                                                             parser: parser,
                                                             simulator: simulator

      command_loop.start
    end

    it 'passes move to the simulator' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')
      parser = double('Parser')
      simulator = double('Simulator')

      expect(fake_stdout).to receive(:puts).twice.with('Enter Command: ')
      expect(fake_stdin).to receive(:gets) { "MOVE\n" }
      expect(parser).to receive(:parse).with('MOVE') { ReaTest::UserInterface::Command.new type: :move }
      expect(simulator).to receive(:move)
      expect(fake_stdin).to receive(:gets) { "EXIT\n" }

      command_loop = ReaTest::UserInterface::CommandLoop.new stdout: fake_stdout,
                                                             stdin: fake_stdin,
                                                             parser: parser,
                                                             simulator: simulator

      command_loop.start
    end

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
