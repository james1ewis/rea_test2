require_relative '../../support/spec_helper'

describe ReaTest::Domain::Mover do

  context 'the new position is within the table bounds' do

    it 'increments robots position heading north' do
      table = double('Table')
      robot = double('Robot')

      initial_position = ReaTest::Domain::Position.new(0, 0, :north)
      new_position = ReaTest::Domain::Position.new(0, 1, :north)

      expect(robot).to receive(:position) { initial_position }
      expect(table).to receive(:out_of_bounds?).with(new_position) { false }
      expect(robot).to receive(:position=).with(new_position)

      mover = ReaTest::Domain::Mover.new table: table
      mover.move(robot)
    end

    it 'increments robots position heading south' do
      table = double('Table')
      robot = double('Robot')

      initial_position = ReaTest::Domain::Position.new(0, 1, :south)
      new_position = ReaTest::Domain::Position.new(0, 0, :south)

      expect(robot).to receive(:position) { initial_position }
      expect(table).to receive(:out_of_bounds?).with(new_position) { false }
      expect(robot).to receive(:position=).with(new_position)

      mover = ReaTest::Domain::Mover.new table: table
      mover.move(robot)
    end

    it 'increments robots position heading east' do
      table = double('Table')
      robot = double('Robot')

      initial_position = ReaTest::Domain::Position.new(0, 0, :east)
      new_position = ReaTest::Domain::Position.new(1, 0, :east)

      expect(robot).to receive(:position) { initial_position }
      expect(table).to receive(:out_of_bounds?).with(new_position) { false }
      expect(robot).to receive(:position=).with(new_position)

      mover = ReaTest::Domain::Mover.new table: table
      mover.move(robot)
    end

    it 'increments robots position heading west' do
      table = double('Table')
      robot = double('Robot')

      initial_position = ReaTest::Domain::Position.new(1, 1, :west)
      new_position = ReaTest::Domain::Position.new(0, 1, :west)

      expect(robot).to receive(:position) { initial_position }
      expect(table).to receive(:out_of_bounds?).with(new_position) { false }
      expect(robot).to receive(:position=).with(new_position)

      mover = ReaTest::Domain::Mover.new table: table
      mover.move(robot)
    end

  end

  context 'new position is out of table bounds' do

    it 'does not increment robots position heading west' do
      table = double('Table')
      robot = double('Robot')

      initial_position = ReaTest::Domain::Position.new(0, 0, :west)
      new_position = ReaTest::Domain::Position.new(-1, 0, :west)

      expect(robot).to receive(:position) { initial_position }
      expect(table).to receive(:out_of_bounds?).with(new_position) { true }

      mover = ReaTest::Domain::Mover.new table: table
      mover.move(robot)
    end

    it 'does not increment robots position heading east' do
      table = double('Table')
      robot = double('Robot')

      initial_position = ReaTest::Domain::Position.new(4, 0, :east)
      new_position = ReaTest::Domain::Position.new(5, 0, :east)

      expect(robot).to receive(:position) { initial_position }
      expect(table).to receive(:out_of_bounds?).with(new_position) { true }

      mover = ReaTest::Domain::Mover.new table: table
      mover.move(robot)
    end

    it 'does not increment robots position heading south' do
      table = double('Table')
      robot = double('Robot')

      initial_position = ReaTest::Domain::Position.new(0, 0, :south)
      new_position = ReaTest::Domain::Position.new(0, -1, :south)

      expect(robot).to receive(:position) { initial_position }
      expect(table).to receive(:out_of_bounds?).with(new_position) { true }

      mover = ReaTest::Domain::Mover.new table: table
      mover.move(robot)
    end

    it 'does not increment robots position heading north' do
      table = double('Table')
      robot = double('Robot')

      initial_position = ReaTest::Domain::Position.new(4, 4, :north)
      new_position = ReaTest::Domain::Position.new(4, 5, :north)

      expect(robot).to receive(:position) { initial_position }
      expect(table).to receive(:out_of_bounds?).with(new_position) { true }

      mover = ReaTest::Domain::Mover.new table: table
      mover.move(robot)
    end

  end
end