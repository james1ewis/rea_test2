require_relative '../../support/spec_helper'

describe ReaTest::Domain::Mover do

  context 'the new position is within the table bounds' do

    it 'increments robots position heading north' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(0, 0, :north)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.move

      expect(robot.position.y).to eq(1)
    end

    it 'increments robots position heading south' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(0, 1, :south)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.move

      expect(robot.position.y).to eq(0)
    end

    it 'increments robots position heading east' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(0, 1, :east)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.move

      expect(robot.position.x).to eq(1)
    end

    it 'increments robots position heading west' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(1, 1, :west)

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

      expect(table).to receive(:out_of_bounds?).with(new_position) { true }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.move

      expect(robot.position.y).to eq(4)
    end

  end
end