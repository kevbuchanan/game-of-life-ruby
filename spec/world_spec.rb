require 'rspec'
require './lib/world'

describe World do
  let(:cell) { Cell.new(:alive) }
  let(:location_1) { GridLocation.new(5, 5, cell) }
  let(:location_2) { GridLocation.new(-1, -2, cell) }
  let(:world) { World.new(location_1, location_2) }

  it 'has an array of locations' do
    expect(world.locations).to eq([location_1, location_2])
  end

  describe 'tick' do
    it 'updates its locations with new neighbors' do
      world.tick
      expect(world.locations.size).to eq(18)
    end

    it 'ticks each location' do
      world.tick
      expect(world.locations.first.cell.next_state).to eq(:dead)
    end

    it 'changes each location' do
      world.tick
      expect(world.locations.first.cell.state).to eq(:dead)
    end
  end
end
