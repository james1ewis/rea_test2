require_relative '../../support/spec_helper'

describe ReaTest::Domain::Robot do

  describe '#place' do

    it 'update the robots current position' do
      robot = ReaTest::Domain::Robot.new
      position = ReaTest::Domain::Position.new(1,2,:north)

      robot.place(position)

      expect(robot.position).to eq(position)
    end

  end

end
