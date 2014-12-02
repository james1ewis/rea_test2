module ReaTest
  module Domain

    module Moveable

      # this also now doesn't really suit a module... should probably move these all out into classes
      def move
        new_position = get_next_position_from_heading(self.position.heading).call(self.position)
        self.position = new_position unless out_of_bounds? new_position
      end


      # it looks like the left and right belong in a class?  Or perhaps rotate should be the only method here...
      def left
        self.position = rotate do |current_heading|
          current_heading == 0 ? current_heading = 3 : current_heading -= 1
        end
      end

      def right
        self.position = rotate do |current_heading|
          current_heading == 3 ? current_heading = 0 : current_heading += 1
        end
      end

      private

      def rotate(&strategy)
        headings = [:north, :east, :south, :west]
        current_heading = headings.find_index(self.position.heading)

        current_heading = strategy.call(current_heading)

        Position.new(self.position.x, self.position.y, headings[current_heading])
      end

      def get_next_position_from_heading(heading)
        { north: Proc.new { |old_position| Position.new(old_position.x, old_position.y + 1, old_position.heading) },
          south: Proc.new { |old_position| Position.new(old_position.x, old_position.y - 1, old_position.heading) },
          east: Proc.new { |old_position| Position.new(old_position.x + 1, old_position.y, old_position.heading) },
          west: Proc.new { |old_position| Position.new(old_position.x - 1, old_position.y, old_position.heading) }
        }[heading]
      end

    end

  end
end
