require_relative '../../support/spec_helper'

describe ReaTest::Domain::RightRotater do

  describe 'rotate_right' do

    it 'rotates the robot right from north' do
      it_rotates_robot_right from: :north,
                             to: :east
    end

    it 'rotates the robot right from west' do
      it_rotates_robot_right from: :west,
                             to: :north
    end

    it 'rotates the robot right from south' do
      it_rotates_robot_right from: :south,
                             to: :west
    end

    it 'rotates the robot right from east' do
      it_rotates_robot_right from: :east,
                             to: :south
    end

  end

end