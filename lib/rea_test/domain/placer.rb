module ReaTest
  module Domain

    class Placer
      def place(placeable, position)
        placeable.position = position
      end
    end

  end
end
