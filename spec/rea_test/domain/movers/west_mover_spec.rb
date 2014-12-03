require_relative '../../../support/spec_helper'

describe ReaTest::Domain::WestMover do

  describe '#move' do

    it 'moves the robot west 1 position' do
      it_moves_robot mover: ReaTest::Domain::WestMover,
                     from: ReaTest::Domain::Position.new(1, 2, :west),
                     to: ReaTest::Domain::Position.new(0, 2, :west)
    end

  end

end
