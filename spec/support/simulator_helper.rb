module SimulatorHelper
  def create_simulator_with_expectations(&expectations)
    robot = double('robot')

    expectations.call(robot)

    ReaTest::Domain::Simulator.new robot: robot
  end
end
