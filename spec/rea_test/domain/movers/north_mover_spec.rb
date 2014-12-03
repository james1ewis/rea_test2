require_relative '../../../support/spec_helper'

describe ReaTest::Domain::NorthMover do

  describe '#move' do

    it 'moves the robot north 1 position' do
      mover = ReaTest::Domain::NorthMover.new
      position = ReaTest::Domain::Position.new(1, 2, :north)
      expected_position = ReaTest::Domain::Position.new(1, 3, :north)

      robot = ReaTest::Domain::Robot.new
      robot.position = position

      mover.move(robot)

      expect(robot.position).to eq(expected_position)
    end

  end

end
