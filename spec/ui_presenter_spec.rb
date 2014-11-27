require_relative 'support/spec_helper'

describe UIPresenter do

  describe '#run' do

    it 'displays options to the user' do

      fake_stdout = double('$stdout')
      fake_stdin = double('$stdin')

      expect(fake_stdout).to receive(:puts).with('Enter EXIT to exit at anytime')

      ui_presenter = UIPresenter.new stdout: fake_stdout,
                                     stdin: fake_stdin

      ui_presenter.run
    end

  end

end
