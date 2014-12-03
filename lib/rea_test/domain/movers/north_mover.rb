require_relative 'mover'

module ReaTest
  module Domain

    class NorthMover < Mover

      protected

      def get_next_position_from(position)
        Position.new(position.x, position.y + 1, position.heading)
      end
    end

  end
end
