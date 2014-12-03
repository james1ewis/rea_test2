require_relative '../../support/spec_helper'

describe ReaTest::Domain::RightRotater do

  describe 'rotate_right' do

    it 'rotates the robot right from north' do
      robot = double('Robot')
      initial_position = ReaTest::Domain::Position.new(4, 4, :north)
      new_position = ReaTest::Domain::Position.new(4, 4, :east)

      expect(robot).to receive(:position) { initial_position }
      expect(robot).to receive(:position=).with(new_position)

      rotater = ReaTest::Domain::RightRotater.new
      rotater.rotate(robot)
    end

    it 'rotates the robot right from west' do
      robot = double('Robot')
      initial_position = ReaTest::Domain::Position.new(4, 4, :west)
      new_position = ReaTest::Domain::Position.new(4, 4, :north)

      expect(robot).to receive(:position) { initial_position }
      expect(robot).to receive(:position=).with(new_position)

      rotater = ReaTest::Domain::RightRotater.new
      rotater.rotate(robot)
    end

    it 'rotates the robot right from south' do
      robot = double('Robot')
      initial_position = ReaTest::Domain::Position.new(4, 4, :south)
      new_position = ReaTest::Domain::Position.new(4, 4, :west)

      expect(robot).to receive(:position) { initial_position }
      expect(robot).to receive(:position=).with(new_position)

      rotater = ReaTest::Domain::RightRotater.new
      rotater.rotate(robot)
    end

    it 'rotates the robot right from east' do
      robot = double('Robot')
      initial_position = ReaTest::Domain::Position.new(4, 4, :east)
      new_position = ReaTest::Domain::Position.new(4, 4, :south)

      expect(robot).to receive(:position) { initial_position }
      expect(robot).to receive(:position=).with(new_position)

      rotater = ReaTest::Domain::RightRotater.new
      rotater.rotate(robot)
    end

  end

end