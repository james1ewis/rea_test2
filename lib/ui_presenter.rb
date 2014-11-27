class UIPresenter
  def initialize(**args)
    @stdout = args[:stdout]
    @stdin = args[:stdin]
  end

  def run
    @stdout.puts 'Enter EXIT to exit at anytime'
  end
end