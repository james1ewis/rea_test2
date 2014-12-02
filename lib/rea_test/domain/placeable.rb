module ReaTest
  module Domain

    module Placeable

      def place(position)
        self.position = position unless self.out_of_bounds? position
      end

    end

  end
end
