require_relative '../support/spec_helper'

describe ReaTest::Application do

  describe '#run' do

    it 'instantiates the main menu' do
      main_menu = double('MainMenu')

      expect(main_menu).to receive(:run)

      application = ReaTest::Application.new main_menu: main_menu
      application.run
    end

  end

end
