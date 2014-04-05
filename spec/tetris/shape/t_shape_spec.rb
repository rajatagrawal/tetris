require 'spec_helper'
require 'tetris/shape/t_shape'
module Tetris
  describe T_Shape do
    let(:window) { double 'window' }

    describe '#initialize' do
      it 'creates and configures block_1' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        t_shape = T_Shape.new(window, config)
        expect(t_shape.block_1.x).to eq 10
        expect(t_shape.block_1.y).to eq 11
        expect(t_shape.block_1.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_2' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        t_shape = T_Shape.new(window, config)
        expect(t_shape.block_2.x).to eq 11
        expect(t_shape.block_2.y).to eq 11
        expect(t_shape.block_2.color).to eq Gosu::Color::BLUE
      end

      it 'creates and configures block_3' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        t_shape = T_Shape.new(window, config)
        expect(t_shape.block_3.x).to eq 11
        expect(t_shape.block_3.y).to eq 10
        expect(t_shape.block_3.color).to eq Gosu::Color::BLUE
      end


      it 'creates and configures block_4' do
        config = { x: 10, y: 10, unit_side: 15, color: 'blue' }
        t_shape = T_Shape.new(window, config)
        expect(t_shape.block_4.x).to eq 12
        expect(t_shape.block_4.y).to eq 11
        expect(t_shape.block_4.color).to eq Gosu::Color::BLUE
      end
    end

    describe '#height' do
      it 'returns height of t_shape' do
        t_shape = T_Shape.new window
        expect(t_shape.height).to eq 2
      end
    end

    describe '#width' do
      it 'returns width of t_shape' do
        t_shape = T_Shape.new window
        expect(t_shape.width).to eq 3
      end
    end

    describe '#block_coordinates' do
      it 'returns coordinates of all four blocks' do
        config = { x: 20, y: 20, unit_side: 15, color: 'blue'}
        t_shape = T_Shape.new(window, config)
        block_coordinates = [[20,21, Gosu::Color::BLUE],
                             [21,21, Gosu::Color::BLUE],
                             [21,20, Gosu::Color::BLUE],
                             [22,21, Gosu::Color::BLUE]]
        expect(t_shape.block_coordinates).to match_array block_coordinates
      end
    end

    describe '#draw' do
      it 'draws blocks of the T_Shape' do
        t_shape = T_Shape.new window
        expect(t_shape.block_1).to receive(:draw)
        expect(t_shape.block_2).to receive(:draw)
        expect(t_shape.block_3).to receive(:draw)
        expect(t_shape.block_4).to receive(:draw)
        t_shape.draw
      end
    end

    describe '#move' do
      it 'moves itself down' do
        t_shape = T_Shape.new window

        expect{t_shape.move('down')}.
          to change{t_shape.y}.by(1)
        expect{t_shape.move('down')}.
          to change{t_shape.block_1.y}.by(1)
        expect{t_shape.move('down')}.
          to change{t_shape.block_2.y}.by(1)
        expect{t_shape.move('down')}.
          to change{t_shape.block_3.y}.by(1)
        expect{t_shape.move('down')}.
          to change{t_shape.block_4.y}.by(1)
      end

      it 'moves itself up' do
        t_shape = T_Shape.new window
        expect{t_shape.move('up')}.
          to change{t_shape.y}.by(-1)
        expect{t_shape.move('up')}.
          to change{t_shape.block_1.y}.by(-1)
        expect{t_shape.move('up')}.
          to change{t_shape.block_2.y}.by(-1)
        expect{t_shape.move('up')}.
          to change{t_shape.block_3.y}.by(-1)
        expect{t_shape.move('up')}.
          to change{t_shape.block_4.y}.by(-1)
      end

      it 'moves itself right' do
        t_shape = T_Shape.new window
        expect{t_shape.move('right')}.
          to change{t_shape.x}.by(1)
        expect{t_shape.move('right')}.
          to change{t_shape.block_1.x}.by(1)
        expect{t_shape.move('right')}.
          to change{t_shape.block_2.x}.by(1)
        expect{t_shape.move('right')}.
          to change{t_shape.block_3.x}.by(1)
        expect{t_shape.move('right')}.
          to change{t_shape.block_4.x}.by(1)
      end

      it 'moves itself left' do
        t_shape = T_Shape.new window
        expect{t_shape.move('left')}.
          to change{t_shape.x}.by(-1)
        expect{t_shape.move('left')}.
          to change{t_shape.block_1.x}.by(-1)
        expect{t_shape.move('left')}.
          to change{t_shape.block_2.x}.by(-1)
        expect{t_shape.move('left')}.
          to change{t_shape.block_3.x}.by(-1)
        expect{t_shape.move('left')}.
          to change{t_shape.block_4.x}.by(-1)
      end
    end
  end
end
