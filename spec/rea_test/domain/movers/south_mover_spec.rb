require_relative '../../../support/spec_helper'

describe ReaTest::Domain::NorthMover do

  describe '#move' do

    it 'moves the robot south 1 position' do
      mover = ReaTest::Domain::SouthMover.new
      position = ReaTest::Domain::Position(1, 2, :south)
      expected_position = ReaTest::Domain::Position(1, 1, :south)

      robot = ReaTest::Domain::Robot.new
      robot.position = position

      mover.move(robot)

      expect(robot.position).to eq(expected_position)
    end

  end

end
