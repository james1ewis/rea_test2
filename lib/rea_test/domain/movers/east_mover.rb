require_relative 'mover'

module ReaTest
  module Domain
    module Movers

      class EastMover < Mover

        protected

        def get_next_position_from(position)
          Position.new(position.x + 1, position.y, position.heading)
        end
      end

    end
  end
end
