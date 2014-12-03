module MoverHelper
  def it_moves_robot(**args)
    robot = double('Robot')

    expect(robot).to receive(:position) { args[:from] }
    expect(robot).to receive(:position=).with(args[:to])

    mover = ReaTest::Domain::Mover.new
    mover.move(robot)
  end
end
