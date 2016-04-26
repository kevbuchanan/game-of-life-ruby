require 'rspec'
require './lib/world'
require './lib/cell'
require './lib/location'

describe World do
  let(:cell) { Cell.new(:alive) }
  let(:location_1) { GridLocation.new(-2, -2, cell) }
  let(:location_2) { GridLocation.new(-1, -2, cell) }
  let(:location_3) { GridLocation.new(0, -2, cell) }
  let(:world) { World.new(location_1, location_2, location_3) }

  it 'has an array of locations' do
    expect(world.locations).to eq([location_1, location_2, location_3])
  end

  describe 'tick' do
    it 'updates its locations with new live neighbors' do
      world.tick
      expect(world.locations.size).to eq(2)
    end

    it 'ticks each location' do
      world.tick
      expect(world.locations.first.cell.next_state).to eq(:alive)
    end

    it 'changes each location' do
      world.tick
      expect(world.locations.first.cell.state).to eq(:alive)
    end
  end
end
