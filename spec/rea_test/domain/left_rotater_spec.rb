require_relative '../../support/spec_helper'

describe ReaTest::Domain::LeftRotater do

  describe '#rotate' do

    it 'rotates the robot left from north' do
      it_rotates_robot_left from: :north,
                            to: :west
    end

    it 'rotates the robot left from west' do
      it_rotates_robot_left from: :west,
                            to: :south
    end

    it 'rotates the robot left from south' do
      it_rotates_robot_left from: :south,
                            to: :east
    end

    it 'rotates the robot left from east' do
      it_rotates_robot_left from: :east,
                            to: :north
    end

  end

end