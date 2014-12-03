require_relative '../support/spec_helper'

describe ReaTest::Application do

  describe '#run' do

    it 'instantiates the main menu' do
      ui_presenter = double('UIPresenter')

      expect(ui_presenter).to receive(:run)

      application = ReaTest::Application.new ui_presenter: ui_presenter
      application.run
    end

    it 'adds the main menu as a listener to the observable simulator' do
      ui_presenter = double('UIPresenter')
      simulator = double('ObservableSimulator')

      expect(ui_presenter).to receive(:run)
      expect(simulator).to receive(:add_listener).with(ui_presenter)

      application = ReaTest::Application.new ui_presenter: ui_presenter
      application.run
    end

  end

end
