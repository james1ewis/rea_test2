require 'rspec'

describe ReaTest::Domain::Rotater do

  describe '#rotate_left' do

    it 'rotates the robot left from north' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :north)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.left

      expect(robot.position.heading).to eq(:west)
    end

    it 'rotates the robot left from west' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :west)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.left

      expect(robot.position.heading).to eq(:south)
    end

    it 'rotates the robot left from south' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :south)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.left

      expect(robot.position.heading).to eq(:east)
    end

    it 'rotates the robot left from east' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :east)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.left

      expect(robot.position.heading).to eq(:north)
    end

  end

  describe 'rotate_right' do

    it 'rotates the robot right from north' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :north)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.right

      expect(robot.position.heading).to eq(:east)
    end

    it 'rotates the robot right from west' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :west)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.right

      expect(robot.position.heading).to eq(:north)
    end

    it 'rotates the robot right from south' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :south)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.right

      expect(robot.position.heading).to eq(:west)
    end

    it 'rotates the robot right from east' do
      table = double('Table')
      initial_position = ReaTest::Domain::Position.new(4, 4, :east)

      allow(table).to receive(:out_of_bounds?) { false }

      robot = ReaTest::Domain::Robot.new table: table
      robot.place(initial_position)
      robot.right

      expect(robot.position.heading).to eq(:south)
    end

  end

end