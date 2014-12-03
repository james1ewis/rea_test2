require_relative '../../../support/spec_helper'

describe ReaTest::Domain::EastMover do

  describe '#move' do

    it 'moves the robot east 1 position' do
      mover = ReaTest::Domain::EastMover.new
      position = ReaTest::Domain::Position.new(1, 2, :east)
      expected_position = ReaTest::Domain::Position.new(2, 2, :east)

      robot = ReaTest::Domain::Robot.new
      robot.position = position

      mover.move(robot)

      expect(robot.position).to eq(expected_position)
    end

  end

end
