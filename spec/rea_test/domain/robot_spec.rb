require_relative '../../support/spec_helper'

describe ReaTest::Domain::Robot do

  describe '#place' do

    it 'places itself' do
      placer = double('Placer')
      position = ReaTest::Domain::Position.new(1, 2, :north)

      robot = ReaTest::Domain::Robot.new placer: placer

      expect(placer).to receive(:place).with(robot, position)

      robot.place(position)
    end

  end

  describe '#move' do

    it 'moves itself' do
      mover = double('Mover')

      robot = ReaTest::Domain::Robot.new mover: mover

      expect(mover).to receive(:move).with(robot)

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

      expect(table).to receive(:out_of_bounds?).with(position) { false }

      robot.position = position

      expect(robot.position).to be_nil
    end

  end

end
