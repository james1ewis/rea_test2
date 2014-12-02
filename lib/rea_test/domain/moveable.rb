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
        self.position = rotate do |current_heading|
          current_heading == 0 ? current_heading = 3 : current_heading -= 1
          current_heading
        end
      end

      def right
        self.position = rotate do |current_heading|
          current_heading == 3 ? current_heading = 0 : current_heading += 1
          current_heading
        end
      end

      private

      def rotate(&strategy)
        headings = [:north, :east, :south, :west]
        current_heading = headings.find_index(self.position.heading)

        current_heading = strategy.call(current_heading)

        Position.new(self.position.x, self.position.y, headings[current_heading])
      end

    end

  end
end
