require_relative '../../support/spec_helper'

describe ReaTest::Domain::Mover do

 describe '#move' do

    it 'increments robots position heading north' do
      it_moves_robot from: ReaTest::Domain::Position.new(0, 0, :north),
                     to: ReaTest::Domain::Position.new(0, 1, :north)
    end

    it 'increments robots position heading south' do
      it_moves_robot from: ReaTest::Domain::Position.new(0, 1, :south),
                     to: ReaTest::Domain::Position.new(0, 0, :south)
    end

    it 'increments robots position heading east' do
      it_moves_robot from: ReaTest::Domain::Position.new(0, 0, :east),
                     to: ReaTest::Domain::Position.new(1, 0, :east)
    end

    it 'increments robots position heading west' do
      it_moves_robot from: ReaTest::Domain::Position.new(1, 1, :west),
                     to: ReaTest::Domain::Position.new(0, 1, :west)
    end

  end

end