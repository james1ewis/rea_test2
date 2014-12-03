require_relative 'mover'
require_relative 'rotater'
require_relative 'placer'
require_relative 'table'

module ReaTest
  module Domain

    class Robot
      attr_reader :position

      def initialize(**args)
        @table = args.fetch(:table, Table.new)
        @placer = args.fetch(:placer, Placer.new)
        @mover = args.fetch(:mover, Mover.new)
        @rotater = args.fetch(:rotater, Rotater.new)
      end

      def place(position)
        @placer.place(self, position)
      end

      def move
        @mover.move(self)
      end

      def left
        @rotater.rotate_left(self)
      end

      def right
        @rotater.rotate_right(self)
      end

      def position=(position)
        @position = position
      end
    end

  end
end
