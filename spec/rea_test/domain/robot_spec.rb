require_relative '../../support/spec_helper'

describe ReaTest::Domain::Robot do

  describe '#place' do

    context 'the position is within the table bounds' do

      it 'update the robots current position' do
        table = double('Table')
        position = ReaTest::Domain::Position.new(1, 2, :north)

        expect(table).to receive(:out_of_bounds?).with(position) { false }

        robot = ReaTest::Domain::Robot.new table: table
        robot.place(position)

        expect(robot.position).to eq(position)
      end

    end

    context 'the position is out of the table bounds' do

      it 'update the robots current position' do
        table = double('Table')
        position = ReaTest::Domain::Position.new(-1, 2, :north)

        expect(table).to receive(:out_of_bounds?).with(position) { true }

        robot = ReaTest::Domain::Robot.new table: table
        robot.place(position)

        expect(robot.position).to eq(nil)
      end

    end

  end

end
