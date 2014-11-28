require_relative 'support/spec_helper'

describe ReaTest::UIPresenter do

  describe '#run' do

    it 'displays options to the user' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')

      expect(fake_stdout).to receive(:puts).with('Enter EXIT to exit at anytime')
      expect(fake_stdout).to receive(:puts).with('Enter START to start the simulator')
      allow(fake_stdin).to receive(:gets) { "EXIT\n" }

      ui_presenter = ReaTest::UIPresenter.new stdout: fake_stdout,
                                              stdin: fake_stdin

      ui_presenter.run
    end

    it 'reads exit command from the user' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')

      allow(fake_stdout).to receive(:puts)
      expect(fake_stdin).to receive(:gets) { "EXIT\n" }

      ui_presenter = ReaTest::UIPresenter.new stdout: fake_stdout,
                                              stdin: fake_stdin

      exit_code = ui_presenter.run

      expect(exit_code).to eq(0)
    end

    it 'reads start command from user and starts input loop' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')

      expect(fake_stdout).to receive(:puts).twice
      expect(fake_stdin).to receive(:gets) { "START\n" }
      expect(fake_stdout).to receive(:puts).twice.with('Enter Command: ')
      expect(fake_stdin).to receive(:gets) { "REPORT\n" }
      expect(fake_stdin).to receive(:gets) { "EXIT\n" }

      ui_presenter = ReaTest::UIPresenter.new stdout: fake_stdout,
                                              stdin: fake_stdin

      ui_presenter.run
    end

  end

end
