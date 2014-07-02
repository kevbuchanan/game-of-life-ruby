require 'rspec'
require './lib/location'

describe GridLocation do
  let(:cell) { Cell.new(:alive) }

  let(:location) { GridLocation.new(1, 2, cell) }
  let(:location_2) { GridLocation.new(1, 1, cell) }

  let(:left) { GridLocation.new(0, 2) }
  let(:right) { GridLocation.new(2, 2) }
  let(:bottom) { GridLocation.new(1, 1) }
  let(:top) { GridLocation.new(1, 3) }
  let(:top_left) { GridLocation.new(0, 3) }
  let(:top_right) { GridLocation.new(2, 3) }
  let(:bottom_left) { GridLocation.new(0, 1) }
  let(:bottom_right) { GridLocation.new(2, 1) }
  let(:neighbors) {[
    left,
    right,
    bottom,
    top,
    top_left,
    top_right,
    bottom_left,
    bottom_right
  ]}

  it 'has a cell' do
    expect(location.cell).to eq(cell)
  end

  it 'has an x coordinate' do
    expect(location.x).to eq(1)
  end

  it 'has a y coordinate' do
    expect(location.y).to eq(2)
  end

  it 'can be compared with other locations' do
    location_2 = GridLocation.new(1, 1)
    expect(location == location_2).to be_falsey

    location_3 = GridLocation.new(1, 2)
    expect(location == location_3).to be_truthy
  end

  it 'can identify its neighbors given a world' do
    location.set_neighbors([location_2, GridLocation.new(10, 10)])
    expect(location.neighbors).to eq(neighbors)
    expect(location.neighbors[2].cell).to eq(cell)
  end

  describe 'tick' do
    it 'ticks its cell with the alive neighbor count' do
      location.set_neighbors([location_2, GridLocation.new(10, 10)])
      location.tick
      expect(location.cell.next_state).to eq(:dead)
    end
  end

  describe 'change' do
    it 'calls change on its cell' do
      location.set_neighbors([location_2, GridLocation.new(10, 10)])
      location.tick
      location.change
      expect(location.cell.state).to eq(:dead)
    end
  end
end
