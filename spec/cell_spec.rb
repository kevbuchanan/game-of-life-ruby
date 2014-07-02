require 'rspec'
require './lib/cell'

describe Cell do
  let(:cell) { Cell.new }

  it 'starts as dead' do
    expect(Cell.new.state).to eq(:dead)
  end

  it 'can be created as alive' do
    expect(Cell.new(:alive).state).to eq(:alive)
  end

  context 'live cell' do
    let(:cell) { Cell.new(:alive) }

    it 'dies with less than two live neighbors' do
      cell.tick(1)
      expect(cell.next_state).to eq(:dead)
    end

    it 'dies with more than three live neighbors' do
      cell.tick(4)
      expect(cell.next_state).to eq(:dead)
    end

    it 'lives with 2 or 3 live neighbors' do
      cell.tick(2)
      expect(cell.next_state).to eq(:alive)

      cell.tick(3)
      expect(cell.next_state).to eq(:alive)
    end
  end

  context 'dead cell' do
    it 'becomes alive with 3 live neighbors' do
      cell.tick(3)
      expect(cell.next_state).to eq(:alive)
    end

    it 'dies with any other number of live neighbors' do
      cell.tick(2)
      expect(cell.next_state).to eq(:dead)
    end
  end

  describe 'change' do
    it 'sets state to next_state' do
      cell.tick(3)
      cell.change
      expect(cell.state).to eq(:alive)
    end
  end
end
