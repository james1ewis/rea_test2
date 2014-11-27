require 'ui_presenter'

module ReaTest
  class Application
    def initialize(**args)
      @ui_presenter = args.fetch(:ui_presenter, UIPresenter.new)
    end

    def run
      @ui_presenter.run
    end
  end
end
