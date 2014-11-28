require_relative '../../support/spec_helper'

describe ReaTest::Domain::Table do

  describe '#out_of_bounds?' do

    it 'returns true if a position is out of bounds' do
      table = ReaTest::Domain::Table.new
      position = ReaTest::Domain::Position.new(-1,-2,:north)

      result = table.out_of_bounds? position

      expect(result).to eq(true)
    end

    it 'returns false if a position is within bounds' do
      table = ReaTest::Domain::Table.new
      position = ReaTest::Domain::Position.new(1,2,:north)

      result = table.out_of_bounds? position

      expect(result).to eq(false)
    end

  end

end
