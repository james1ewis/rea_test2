require 'rspec'

describe ReaTest::Domain::Placer do

  describe '#place' do

    it 'places robots on a table' do
      table = double('Table')
      robot = double('Robot')
      position = ReaTest::Domain::Position.new(1, 2, :north)
      placer = ReaTest::Domain::Placer.new table: table

      expect(robot).to receive(:position=).with(position)
      
      placer.place(robot, position)
    end

  end

end