require_relative '../../../support/spec_helper'

describe ReaTest::Domain::SouthMover do

  describe '#move' do

    it 'moves the robot south 1 position' do
      it_moves_robot mover: ReaTest::Domain::SouthMover,
                     from: ReaTest::Domain::Position.new(1, 2, :south),
                     to: ReaTest::Domain::Position.new(1, 1, :south)
    end

  end

end
