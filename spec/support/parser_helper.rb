module ParserHelper
  def create_with_expectations(&expectations)
    command_factory = double('CommandFactory')

    expectations.call(command_factory)

    ReaTest::UserInterface::Parser.new command_factory: command_factory
  end
end
