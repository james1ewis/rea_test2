require_relative 'north_mover'
require_relative 'south_mover'
require_relative 'east_mover'
require_relative 'west_mover'

module ReaTest
  module Domain
    module Movers

      class MoveFactory
        def initialize
          # could loads these dynamically...
          @mover_mappings = { north: NorthMover,
                              south: SouthMover,
                              east: EastMover,
                              west: WestMover }
        end

        def create(direction)
          @mover_mappings[direction].new
        end
      end

    end
  end
end
