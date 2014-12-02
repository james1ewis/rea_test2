module ReaTest
  module Domain

    module Moveable
      def move
        case self.position.heading
        when :north then self.position = Position.new(self.position.x, self.position.y + 1, self.position.heading)
        when :south then self.position = Position.new(self.position.x, self.position.y - 1, self.position.heading)
        when :east then self.position = Position.new(self.position.x + 1, self.position.y, self.position.heading)
        when :west then self.position = Position.new(self.position.x - 1, self.position.y, self.position.heading)
        end
      end
    end

  end
end
