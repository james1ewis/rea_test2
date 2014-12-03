require_relative '../../support/spec_helper'

describe ReaTest::Domain::Placer do

  describe '#place' do

    context 'the position is within the table bounds' do

      it 'update the robots current position' do
        table = double('Table')
        robot = double('Robot')
        position = ReaTest::Domain::Position.new(1, 2, :north)
        placer = ReaTest::Domain::Placer.new table: table

        expect(table).to receive(:out_of_bounds?).with(position) { false }
        expect(robot).to receive(:position=).with(position)

        placer.place(robot, position)
      end

    end

    context 'the position is out of the table bounds' do

      it 'update the robots current position' do
        table = double('Table')
        robot = double('Robot')
        position = ReaTest::Domain::Position.new(-11, 2, :north)
        placer = ReaTest::Domain::Placer.new table: table

        expect(table).to receive(:out_of_bounds?).with(position) { true }

        placer.place(robot, position)
      end

    end

  end

end