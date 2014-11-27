class UIPresenter
  def initialize(**args)
    @stdout = args.fetch(:stdout, $stdout)
    @stdin = args.fetch(:stdin, $stdin)
  end

  def run
    @stdout.puts 'Enter EXIT to exit at anytime'
    @stdout.puts 'Enter START to start the simulator'
    command = @stdin.gets.chomp

    return 0 if command.eql? 'EXIT'
  end
end
