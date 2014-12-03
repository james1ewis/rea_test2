require_relative 'rotater'

module ReaTest
  module Domain

    class LeftRotater < Rotater
      def get_next_heading(current_heading)
        current_heading == 0 ? current_heading = 3 : current_heading -= 1
      end
    end

  end
end
