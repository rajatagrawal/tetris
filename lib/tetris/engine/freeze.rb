module Tetris
  module Engine
    class Freeze

      def initialize(tetris_map)
        @tetris_map = tetris_map
      end

      def can_freeze_shape? shape
        shape.coordinates.any? do |x,y, _|
          reached_bottom_of_map?(y) || space_occupied?(x,y)
        end
      end

      def freeze_shape shape
        shape.coordinates.each do |x,y,color|
          @tetris_map[x,y] = color
        end
      end

      private

      def reached_bottom_of_map?(y)
        (y + 1) > @tetris_map.height
      end

      def space_occupied?(x,y)
        @tetris_map[x,y+1] != 'none'
      end
    end
  end
end
