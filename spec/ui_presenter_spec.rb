require_relative 'support/spec_helper'

describe UIPresenter do

  describe '#run' do

    it 'displays options to the user' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')

      expect(fake_stdout).to receive(:puts).with('Enter EXIT to exit at anytime')
      expect(fake_stdout).to receive(:puts).with('Enter START to start the simulator')
      allow(fake_stdin).to receive(:chomp)

      ui_presenter = UIPresenter.new stdout: fake_stdout,
                                     stdin: fake_stdin

      ui_presenter.run
    end

    it 'reads initial command from the user' do
      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')

      allow(fake_stdout).to receive(:puts)
      expect(fake_stdin).to receive(:chomp)

      ui_presenter = UIPresenter.new stdout: fake_stdout,
                                     stdin: fake_stdin

      ui_presenter.run
    end

  end

end
