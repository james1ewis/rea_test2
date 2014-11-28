require_relative '../../support/spec_helper'

describe ReaTest::Domain::Robot do

  describe '#place' do

    it 'update the robots current position' do
      robot = ReaTest::Domain::Robot.new
      position = ReaTest::Domain::Position.new(1, 2, :north)

      robot.place(position)
      result = robot.report

      expect(result).to eq(position)
    end

  end

  describe '#report' do

    it 'reports the robots current position' do
      robot = ReaTest::Domain::Robot.new
      position = ReaTest::Domain::Position.new(1, 2, :north)

      robot.place(position)
      result = robot.report

      expect(result).to eq(position)
    end

  end

end
