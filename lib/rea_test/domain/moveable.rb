module ReaTest
  module Domain

    module Moveable

      def move
        new_position = nil

        case self.position.heading
        when :north then new_position = Position.new(self.position.x, self.position.y + 1, self.position.heading)
        when :south then new_position = Position.new(self.position.x, self.position.y - 1, self.position.heading)
        when :east then new_position = Position.new(self.position.x + 1, self.position.y, self.position.heading)
        when :west then new_position = Position.new(self.position.x - 1, self.position.y, self.position.heading)
        end

        self.position = new_position unless out_of_bounds? new_position
      end

    end

  end
end
