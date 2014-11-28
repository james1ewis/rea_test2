require_relative '../support/spec_helper'

describe ReaTest::Application do

  describe '#run' do

    it 'instantiates the user interface' do
      ui_presenter = double('UIPresenter')
      expect(ui_presenter).to receive(:run)

      application = ReaTest::Application.new ui_presenter: ui_presenter

      application.run
    end

  end

end
