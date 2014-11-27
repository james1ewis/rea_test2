module ReaTest
  class Application
    def initialize(**args)
      @ui_presenter = args[:ui_presenter]
    end

    def run
      @ui_presenter.run($stdout, $stdin)
    end
  end
end
