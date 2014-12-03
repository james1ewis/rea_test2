module ReaTest
  module Domain
    module Movers

      class Mover
        def move(moveable)
          moveable.position = get_next_position_from(moveable.position)
        end
      end

    end
  end
end
