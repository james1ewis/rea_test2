require_relative '../../support/spec_helper'

describe ReaTest::Domain::Table do

  describe '#out_of_bounds?' do

    before :each do
      @table = ReaTest::Domain::Table.new
    end

    it 'returns true if a position is out of bounds' do
      position = ReaTest::Domain::Position.new(-1,-2,:north)
      expect(@table.out_of_bounds? position).to eq(true)
    end

    it 'returns false if a position is within bounds' do
      position = ReaTest::Domain::Position.new(1,2,:north)
      expect(@table.out_of_bounds? position).to eq(false)
    end

  end

end
