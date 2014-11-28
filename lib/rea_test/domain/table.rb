module ReaTest
  module Domain

    class Table
      def out_of_bounds?(position)
        position.x.between?(0,4) && position.y.between?(0,4) ? false : true
      end
    end

  end
end
