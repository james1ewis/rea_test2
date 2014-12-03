require_relative 'user_interface/main_menu'

module ReaTest

  class Application
    def initialize(**args)
      @main_menu = args.fetch(:main_menu, UserInterface::MainMenu.new)
    end

    def run
      @main_menu.run
    end
  end

end
