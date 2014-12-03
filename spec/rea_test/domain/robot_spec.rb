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

    end

  end

  describe '#right' do

    it 'rotates itself right' do

    end

  end

end
