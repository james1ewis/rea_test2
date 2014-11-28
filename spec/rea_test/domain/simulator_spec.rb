require_relative '../../support/spec_helper'

describe ReaTest::Domain::Simulator do

  describe '#execute' do

    it 'executes a place command' do
      robot = double('robot')
      position = ReaTest::Domain::Position.new(0, 0, :north)
      command = ReaTest::Domain::Command.new type: :place,
                                             parameters: { position: position }

      expect(robot).to receive(:place).with(position)

      simulator = ReaTest::Domain::Simulator.new robot: robot
      simulator.execute(command)
    end

    it 'executes a report command' do
      robot = double('robot')
      command = ReaTest::Domain::Command.new type: :report

      expect(robot).to receive(:report)

      simulator = ReaTest::Domain::Simulator.new robot: robot
      simulator.execute(command)
    end

  end

end
