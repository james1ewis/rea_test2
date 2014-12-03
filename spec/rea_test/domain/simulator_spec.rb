require_relative '../../support/spec_helper'

describe ReaTest::Domain::Simulator do

  describe '#place' do

    it 'places the robot on the table' do
      robot = double('robot')
      position = ReaTest::Domain::Position.new(0, 0, :north)

      expect(robot).to receive(:position=).with(position)

      simulator = ReaTest::Domain::Simulator.new robot: robot
      simulator.place(position)
    end

  end

  describe '#report' do

    it 'reports the position of the robot' do
      robot = double('robot')
      position = ReaTest::Domain::Position.new(1, 1, :north)

      expect(robot).to receive(:position) { position }

      simulator = ReaTest::Domain::Simulator.new robot: robot
      expect(simulator.report).to eq(position.to_s)
    end

  end

  describe '#move' do

    it 'moves the robot' do
      robot = double('robot')

      expect(robot).to receive(:move)

      simulator = ReaTest::Domain::Simulator.new robot: robot
      simulator.move
    end

  end

  describe '#left' do

    it 'rotates the robot left' do
      robot = double('robot')

      expect(robot).to receive(:left)

      simulator = ReaTest::Domain::Simulator.new robot: robot
      simulator.left
    end

  end

  describe '#right' do

    it 'rotates the robot right' do
      robot = double('robot')

      expect(robot).to receive(:right)

      simulator = ReaTest::Domain::Simulator.new robot: robot
      simulator.right
    end

  end

end
