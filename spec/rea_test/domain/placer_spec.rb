require_relative '../../support/spec_helper'

describe ReaTest::Domain::Placer do

  describe '#place' do

    it 'update the robots current position' do
      robot = double('Robot')
      position = ReaTest::Domain::Position.new(1, 2, :north)
      placer = ReaTest::Domain::Placer.new

      expect(robot).to receive(:position=).with(position)

      placer.place(robot, position)
    end

  end

end
