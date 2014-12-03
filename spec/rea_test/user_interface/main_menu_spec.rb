require_relative '../../support/spec_helper'

describe ReaTest::UserInterface::MainMenu do

  describe '#run' do

    it 'displays options to the user' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')
      parser = double('Parser')

      expect(fake_stdout).to receive(:puts).with('Enter EXIT to exit at anytime')
      expect(fake_stdout).to receive(:puts).with('Enter START to start the simulator')
      allow(fake_stdin).to receive(:gets) { "EXIT\n" }

      ui_presenter = ReaTest::UserInterface::MainMenu.new stdout: fake_stdout,
                                                      stdin: fake_stdin,
                                                      parser: parser

      ui_presenter.run
    end

    it 'reads exit command from the user' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')
      parser = double('Parser')

      allow(fake_stdout).to receive(:puts)
      expect(fake_stdin).to receive(:gets) { "EXIT\n" }

      ui_presenter = ReaTest::UserInterface::MainMenu.new stdout: fake_stdout,
                                                      stdin: fake_stdin,
                                                      parser: parser

      ui_presenter.run
    end

    it 'starts the command loop' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')
      parser = double('Parser')

      allow(fake_stdout).to receive(:puts).with('Enter EXIT to exit at anytime')
      allow(fake_stdout).to receive(:puts).with('Enter START to start the simulator')
      allow(fake_stdin).to receive(:gets).and_return("START\n", "EXIT\n")

      expect(fake_stdout).to receive(:puts).with('Enter Command: ')

      ui_presenter = ReaTest::UserInterface::MainMenu.new stdout: fake_stdout,
                                                      stdin: fake_stdin,
                                                      parser: parser

      ui_presenter.run
    end

    it 'executes commands' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')
      parser = double('Parser')
      move_command = double('MoveCommand')

      allow(fake_stdout).to receive(:puts).with('Enter EXIT to exit at anytime')
      allow(fake_stdout).to receive(:puts).with('Enter START to start the simulator')
      allow(fake_stdin).to receive(:gets).and_return("START\n", "MOVE\n", "EXIT\n")
      allow(fake_stdout).to receive(:puts).at_least(1).times.with('Enter Command: ')

      expect(parser).to receive(:parser).with('MOVE') { move_command }
      expect(move_command).to receive(:execute)

      ui_presenter = ReaTest::UserInterface::MainMenu.new stdout: fake_stdout,
                                                          stdin: fake_stdin,
                                                          parser: parser

      ui_presenter.run
    end

  end

end
