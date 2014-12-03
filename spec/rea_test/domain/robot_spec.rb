require_relative '../../support/spec_helper'

describe ReaTest::Domain::Robot do

  describe '#move' do

    it 'moves itself' do
      move_factory = double('MoveFactory')
      north_mover = double('NorthMover')
      position = ReaTest::Domain::Position.new(1, 2, :north)

      robot = ReaTest::Domain::Robot.new move_factory: move_factory

      expect(move_factory).to receive(:create).with(:north) { north_mover }
      expect(north_mover).to receive(:move).with(robot)

      robot.position = position
      robot.move
    end

  end

  describe '#left' do

    it 'rotates itself left' do
      rotater = double('LeftRotater')

      robot = ReaTest::Domain::Robot.new left_rotater: rotater

      expect(rotater).to receive(:rotate).with(robot)

      robot.left
    end

  end

  describe '#right' do

    it 'rotates itself right' do
      rotater = double('RightRotater')

      robot = ReaTest::Domain::Robot.new right_rotater: rotater

      expect(rotater).to receive(:rotate).with(robot)

      robot.right
    end

  end

  describe '#position=' do

    it 'does not update if the new position is off the table' do
      table = double('Table')
      robot = ReaTest::Domain::Robot.new table: table
      position = ReaTest::Domain::Position.new(-1, -2, :north)

      expect(table).to receive(:out_of_bounds?).with(position) { true }

      robot.position = position

      expect(robot.position).to be_nil
    end

  end

end
