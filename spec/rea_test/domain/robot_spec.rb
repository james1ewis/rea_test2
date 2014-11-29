require_relative '../../support/spec_helper'

describe ReaTest::Domain::Robot do

  describe '#place' do

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

    it 'increments robots position heading north' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(0, 0, :north)

      expect(table).to receive(:out_of_bounds?).with(initial_position) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.move

      expect(robot.position.y).to eq(1)
    end

    it 'increments robots position heading south' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(0, 1, :south)

      expect(table).to receive(:out_of_bounds?).with(initial_position) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.move

      expect(robot.position.y).to eq(0)
    end

    it 'increments robots position heading east' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(0, 1, :east)

      expect(table).to receive(:out_of_bounds?).with(initial_position) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.move

      expect(robot.position.x).to eq(1)
    end

    it 'increments robots position heading west' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(1, 1, :west)

      expect(table).to receive(:out_of_bounds?).with(initial_position) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.move

      expect(robot.position.x).to eq(0)
    end

  end

end
