require_relative 'user_interface/main_menu'

module ReaTest

  class Application
    def initialize(**args)
      @ui_presenter = args.fetch(:ui_presenter, UserInterface::MainMenu.new)
    end

    def run
      @ui_presenter.run
    end
  end

end
