require_relative '../../support/spec_helper'

describe ReaTest::Domain::MoveFactory do

  describe '#create' do

    it 'creates a north_mover' do
      factory = ReaTest::Domain::MoveFactory.new
      mover = factory.create(:north)

      expect(mover).to be_a(NorthMover)
    end

    it 'creates a south_mover' do
      factory = ReaTest::Domain::MoveFactory.new
      mover = factory.create(:north)

      expect(mover).to be_a(SouthMover)
    end

    it 'creates a east_mover' do
      factory = ReaTest::Domain::MoveFactory.new
      mover = factory.create(:north)

      expect(mover).to be_a(EastMover)
    end

    it 'creates a west_mover' do
      factory = ReaTest::Domain::MoveFactory.new
      mover = factory.create(:north)

      expect(mover).to be_a(WestMover)
    end

  end

end