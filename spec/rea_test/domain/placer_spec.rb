require 'rspec'

describe ReaTest::Domain::Placer do

  describe '#place' do

    it 'places robots on a table' do
      table = double('Table')
      robot = double('Robot')
      position = ReaTest::Domain::Position.new(1, 2, :north)

      placer = ReaTest::Domain::Placer.new table: table

      placer.place(robot, position)

      expect(robot.position).to eq(position)
    end

  end

end