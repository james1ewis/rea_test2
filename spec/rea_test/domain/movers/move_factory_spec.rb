require_relative '../../../support/spec_helper'

describe ReaTest::Domain::Movers::MoveFactory do

  describe '#create' do

    before :each do
      @factory = ReaTest::Domain::Movers::MoveFactory.new
    end

    it 'creates a north_mover' do
      mover = @factory.create(:north)
      expect(mover).to be_a(ReaTest::Domain::Movers::NorthMover)
    end

    it 'creates a south_mover' do
      mover = @factory.create(:south)
      expect(mover).to be_a(ReaTest::Domain::Movers::SouthMover)
    end

    it 'creates a east_mover' do
      mover = @factory.create(:east)
      expect(mover).to be_a(ReaTest::Domain::Movers::EastMover)
    end

    it 'creates a west_mover' do
      mover = @factory.create(:west)
      expect(mover).to be_a(ReaTest::Domain::Movers::WestMover)
    end

  end

end
