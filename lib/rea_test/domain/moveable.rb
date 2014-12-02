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

      def left
        case self.position.heading
        when :north then self.position = Position.new(self.position.x, self.position.y, :west)
        when :south then self.position = Position.new(self.position.x, self.position.y, :east)
        when :east then self.position = Position.new(self.position.x, self.position.y, :north)
        when :west then self.position = Position.new(self.position.x, self.position.y, :south)
        end
      end

      def right
        case self.position.heading
        when :north then self.position = Position.new(self.position.x, self.position.y, :east)
        when :south then self.position = Position.new(self.position.x, self.position.y, :west)
        when :east then self.position = Position.new(self.position.x, self.position.y, :south)
        when :west then self.position = Position.new(self.position.x, self.position.y, :north)
        end
      end

    end

  end
end
