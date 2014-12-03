require_relative '../../../support/spec_helper'

describe ReaTest::Domain::EastMover do

  describe '#move' do

    it 'moves the robot east 1 position' do
      it_moves_robot mover: ReaTest::Domain::EastMover,
                     from: ReaTest::Domain::Position.new(1, 2, :east),
                     to: ReaTest::Domain::Position.new(2, 2, :east)
    end

  end

end
