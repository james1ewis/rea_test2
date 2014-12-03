require_relative '../../../support/spec_helper'

describe ReaTest::Domain::NorthMover do

  describe '#move' do

    it 'moves the robot north 1 position' do
      it_moves_robot mover: ReaTest::Domain::NorthMover,
                     from: ReaTest::Domain::Position.new(1, 2, :north),
                     to: ReaTest::Domain::Position.new(1, 3, :north)
    end

  end

end
