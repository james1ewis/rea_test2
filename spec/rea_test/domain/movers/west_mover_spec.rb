require_relative '../../../support/spec_helper'

describe ReaTest::Domain::WestMover do

  describe '#move' do

    it 'moves the robot west 1 position' do
      mover = ReaTest::Domain::WestMover.new
      position = ReaTest::Domain::Position.new(1, 2, :west)
      expected_position = ReaTest::Domain::Position.new(0, 2, :west)

      robot = ReaTest::Domain::Robot.new
      robot.position = position

      mover.move(robot)

      expect(robot.position).to eq(expected_position)
    end

  end

end
