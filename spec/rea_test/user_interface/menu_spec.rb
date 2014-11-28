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

    it 'starts the command loop' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')
      command_loop = double('CommandLoop')

      allow(fake_stdout).to receive(:puts).twice
      allow(fake_stdin).to receive(:gets) { "START\n" }
      expect(command_loop).to receive(:start)

      ui_presenter = ReaTest::UserInterface::Menu.new stdout: fake_stdout,
                                                      stdin: fake_stdin,
                                                      command_loop: command_loop

      ui_presenter.run
    end

  end

end
