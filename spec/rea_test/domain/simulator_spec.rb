require_relative '../../support/spec_helper'

describe ReaTest::Domain::Simulator do

  describe '#place' do

    it 'places the robot on the table' do
      position = ReaTest::Domain::Position.new(0, 0, :north)

      simulator = create_simulator_with_expectations do |robot|
        expect(robot).to receive(:position=).with(position)
      end

      simulator.place(position)
    end

  end

  describe '#report' do

    it 'reports the position of the robot' do
      position = ReaTest::Domain::Position.new(1, 1, :north)

      simulator = create_simulator_with_expectations do |robot|
        expect(robot).to receive(:position).twice { position }
      end

      expect(simulator.report).to eq(position.to_s)
    end


    it 'does not report the position of the robot if it is unplaced' do
      robot = double('Robot')

      expect(robot).to receive(:position) { nil }

      simulator = ReaTest::Domain::Simulator.new robot: robot
      simulator.report
    end

  end

  describe '#move' do

    it 'moves the robot' do
      simulator = create_simulator_with_expectations do |robot|
        expect(robot).to receive(:move)
      end

      simulator.move
    end

  end

  describe '#left' do

    it 'rotates the robot left' do
      simulator = create_simulator_with_expectations do |robot|
        expect(robot).to receive(:left)
      end

      simulator.left
    end

  end

  describe '#right' do

    it 'rotates the robot right' do
      simulator = create_simulator_with_expectations do |robot|
        expect(robot).to receive(:right)
      end

      simulator.right
    end

  end

end
