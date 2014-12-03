module CommandHelper
  def calls_simulator_with_expected_message(**args)
    simulator = double('Simulator')

    expect(simulator).to receive(args[:message])

    command = args[:command].new simulator: simulator
    command.execute
  end
end
