require_relative '../../support/spec_helper'

describe ReaTest::Domain::Mover do

 describe '#move' do

    it 'increments robots position heading north' do
      robot = double('Robot')

      initial_position = ReaTest::Domain::Position.new(0, 0, :north)
      new_position = ReaTest::Domain::Position.new(0, 1, :north)

      expect(robot).to receive(:position) { initial_position }
      expect(robot).to receive(:position=).with(new_position)

      mover = ReaTest::Domain::Mover.new
      mover.move(robot)
    end

    it 'increments robots position heading south' do
      robot = double('Robot')

      initial_position = ReaTest::Domain::Position.new(0, 1, :south)
      new_position = ReaTest::Domain::Position.new(0, 0, :south)

      expect(robot).to receive(:position) { initial_position }
      expect(robot).to receive(:position=).with(new_position)

      mover = ReaTest::Domain::Mover.new
      mover.move(robot)
    end

    it 'increments robots position heading east' do
      robot = double('Robot')

      initial_position = ReaTest::Domain::Position.new(0, 0, :east)
      new_position = ReaTest::Domain::Position.new(1, 0, :east)

      expect(robot).to receive(:position) { initial_position }
      expect(robot).to receive(:position=).with(new_position)

      mover = ReaTest::Domain::Mover.new
      mover.move(robot)
    end

    it 'increments robots position heading west' do
      robot = double('Robot')

      initial_position = ReaTest::Domain::Position.new(1, 1, :west)
      new_position = ReaTest::Domain::Position.new(0, 1, :west)

      expect(robot).to receive(:position) { initial_position }
      expect(robot).to receive(:position=).with(new_position)

      mover = ReaTest::Domain::Mover.new
      mover.move(robot)
    end

  end

end