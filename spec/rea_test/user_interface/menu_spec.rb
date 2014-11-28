require_relative '../../support/spec_helper'

describe ReaTest::UserInterface::Menu do

  describe '#run' do

    it 'displays options to the user' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')

      expect(fake_stdout).to receive(:puts).with('Enter EXIT to exit at anytime')
      expect(fake_stdout).to receive(:puts).with('Enter START to start the simulator')
      allow(fake_stdin).to receive(:gets) { "EXIT\n" }

      ui_presenter = ReaTest::UserInterface::Menu.new stdout: fake_stdout,
                                                      stdin: fake_stdin

      ui_presenter.run
    end

    it 'reads exit command from the user' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')

      allow(fake_stdout).to receive(:puts)
      expect(fake_stdin).to receive(:gets) { "EXIT\n" }

      ui_presenter = ReaTest::UserInterface::Menu.new stdout: fake_stdout,
                                                      stdin: fake_stdin

      ui_presenter.run
    end

    it 'reads start command from user and starts input loop' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')

      expect(fake_stdout).to receive(:puts).twice
      expect(fake_stdin).to receive(:gets) { "START\n" }
      expect(fake_stdout).to receive(:puts).twice.with('Enter Command: ')
      expect(fake_stdin).to receive(:gets) { "REPORT\n" }
      expect(fake_stdin).to receive(:gets) { "EXIT\n" }

      ui_presenter = ReaTest::UserInterface::Menu.new stdout: fake_stdout,
                                                      stdin: fake_stdin

      ui_presenter.run
    end

    it 'passes command to the simulator' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')
      parser = double('Parser')
      simulator = double('Simulator')

      expect(fake_stdout).to receive(:puts).twice
      expect(fake_stdin).to receive(:gets) { "START\n" }
      expect(fake_stdout).to receive(:puts).twice.with('Enter Command: ')
      expect(fake_stdin).to receive(:gets) { "REPORT\n" }
      expect(parser).to receive(:parse).with('REPORT') { ReaTest::UserInterface::Command.new type: :report }
      expect(simulator).to receive(:report)
      expect(fake_stdin).to receive(:gets) { "EXIT\n" }

      ui_presenter = ReaTest::UserInterface::Menu.new stdout: fake_stdout,
                                                      stdin: fake_stdin,
                                                      parser: parser,
                                                      simulator: simulator

      ui_presenter.run
    end

  end

end
