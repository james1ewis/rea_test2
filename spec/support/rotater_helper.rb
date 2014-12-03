module RotaterHelper
  def it_rotates_robot_right(**args)
    robot = double('Robot')
    initial_position = ReaTest::Domain::Position.new(4, 4, args[:from])
    new_position = ReaTest::Domain::Position.new(4, 4, args[:to])

    expect(robot).to receive(:position) { initial_position }
    expect(robot).to receive(:position=).with(new_position)

    rotater = ReaTest::Domain::RightRotater.new
    rotater.rotate(robot)
  end

  def it_rotates_robot_left(**args)
    robot = double('Robot')
    initial_position = ReaTest::Domain::Position.new(4, 4, args[:from])
    new_position = ReaTest::Domain::Position.new(4, 4, args[:to])

    expect(robot).to receive(:position) { initial_position }
    expect(robot).to receive(:position=).with(new_position)

    rotater = ReaTest::Domain::LeftRotater.new
    rotater.rotate(robot)
  end
end
