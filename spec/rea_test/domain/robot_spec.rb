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

    context 'the position is within the table bounds' do

      it 'update the robots current position' do
        table = double('Table')
        position = ReaTest::Domain::Position.new(1, 2, :north)

        expect(table).to receive(:out_of_bounds?).with(position) { false }

        robot = ReaTest::Domain::Robot.new table: table
        robot.place(position)

        expect(robot.position).to eq(position)
      end

    end

    context 'the position is out of the table bounds' do

      it 'update the robots current position' do
        table = double('Table')
        position = ReaTest::Domain::Position.new(-1, 2, :north)

        expect(table).to receive(:out_of_bounds?).with(position) { true }

        robot = ReaTest::Domain::Robot.new table: table
        robot.place(position)

        expect(robot.position).to eq(nil)
      end

    end

  end

  describe '#move' do

    context 'the new position is within the table bounds' do

      it 'increments robots position heading north' do
        table = double('Table')
        initial_position = ReaTest::Domain::Position.new(0, 0, :north)

        expect(table).to receive(:out_of_bounds?).with(initial_position) { false }
        allow(table).to receive(:out_of_bounds?) { false }

        robot = ReaTest::Domain::Robot.new table: table
        robot.place(initial_position)
        robot.move

        expect(robot.position.y).to eq(1)
      end

      it 'increments robots position heading south' do
        table = double('Table')
        initial_position = ReaTest::Domain::Position.new(0, 1, :south)

        expect(table).to receive(:out_of_bounds?).with(initial_position) { false }
        allow(table).to receive(:out_of_bounds?) { false }

        robot = ReaTest::Domain::Robot.new table: table
        robot.place(initial_position)
        robot.move

        expect(robot.position.y).to eq(0)
      end

      it 'increments robots position heading east' do
        table = double('Table')
        initial_position = ReaTest::Domain::Position.new(0, 1, :east)

        expect(table).to receive(:out_of_bounds?).with(initial_position) { false }
        allow(table).to receive(:out_of_bounds?) { false }

        robot = ReaTest::Domain::Robot.new table: table
        robot.place(initial_position)
        robot.move

        expect(robot.position.x).to eq(1)
      end

      it 'increments robots position heading west' do
        table = double('Table')
        initial_position = ReaTest::Domain::Position.new(1, 1, :west)

        expect(table).to receive(:out_of_bounds?).with(initial_position) { false }
        allow(table).to receive(:out_of_bounds?) { false }

        robot = ReaTest::Domain::Robot.new table: table
        robot.place(initial_position)
        robot.move

        expect(robot.position.x).to eq(0)
      end

    end

    context 'new position is out of table bounds' do

      it 'does not increment robots position heading west' do
        table = double('Table')
        initial_position = ReaTest::Domain::Position.new(0, 0, :west)
        new_position = ReaTest::Domain::Position.new(-1, 0, :west)

        expect(table).to receive(:out_of_bounds?).with(initial_position) { false }
        expect(table).to receive(:out_of_bounds?).with(new_position) { true }

        robot = ReaTest::Domain::Robot.new table: table
        robot.place(initial_position)
        robot.move

        expect(robot.position.x).to eq(0)
      end

      it 'does not increment robots position heading east' do
        table = double('Table')
        initial_position = ReaTest::Domain::Position.new(4, 0, :east)
        new_position = ReaTest::Domain::Position.new(5, 0, :east)

        expect(table).to receive(:out_of_bounds?).with(initial_position) { false }
        expect(table).to receive(:out_of_bounds?).with(new_position) { true }

        robot = ReaTest::Domain::Robot.new table: table
        robot.place(initial_position)
        robot.move

        expect(robot.position.x).to eq(4)
      end

      it 'does not increment robots position heading south' do
        table = double('Table')
        initial_position = ReaTest::Domain::Position.new(0, 0, :south)
        new_position = ReaTest::Domain::Position.new(0, -1, :south)

        expect(table).to receive(:out_of_bounds?).with(initial_position) { false }
        expect(table).to receive(:out_of_bounds?).with(new_position) { true }

        robot = ReaTest::Domain::Robot.new table: table
        robot.place(initial_position)
        robot.move

        expect(robot.position.y).to eq(0)
      end

      it 'does not increment robots position heading north' do
        table = double('Table')
        initial_position = ReaTest::Domain::Position.new(4, 4, :north)
        new_position = ReaTest::Domain::Position.new(4, 5, :north)

        expect(table).to receive(:out_of_bounds?).with(initial_position) { false }
        expect(table).to receive(:out_of_bounds?).with(new_position) { true }

        robot = ReaTest::Domain::Robot.new table: table
        robot.place(initial_position)
        robot.move

        expect(robot.position.y).to eq(4)
      end

    end

  end

  describe '#left' do

    it 'rotates the robot left from north' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :north)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.left

      expect(robot.position.heading).to eq(:west)
    end

    it 'rotates the robot left from west' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :west)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.left

      expect(robot.position.heading).to eq(:south)
    end

    it 'rotates the robot left from south' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :south)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.left

      expect(robot.position.heading).to eq(:east)
    end

    it 'rotates the robot left from east' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :east)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.left

      expect(robot.position.heading).to eq(:north)
    end

  end

  describe '#right' do

    it 'rotates the robot right from north' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :north)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.right

      expect(robot.position.heading).to eq(:east)
    end

    it 'rotates the robot right from west' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :west)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.right

      expect(robot.position.heading).to eq(:north)
    end

    it 'rotates the robot right from south' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :south)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.right

      expect(robot.position.heading).to eq(:west)
    end

    it 'rotates the robot right from east' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :east)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.right

      expect(robot.position.heading).to eq(:south)
    end

  end

end
