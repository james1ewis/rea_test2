require_relative '../../support/spec_helper'

describe ReaTest::Domain::Position do

  describe '#to_s' do

    it 'returns string representation of object' do
      position = ReaTest::Domain::Position.new(1,2,:north)
      expect(position.to_s).to eq('1,2,NORTH')
    end

  end

end
