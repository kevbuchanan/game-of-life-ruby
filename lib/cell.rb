class Cell
  LIVE_STATES = {
    alive: [2, 3],
     dead: [3]
  }

  attr_reader :state, :next_state, :neighbors

  def initialize(state = :dead)
    @state = state
  end

  def alive?
    state == :alive
  end

  def tick(neighbors)
    @neighbors = neighbors
    @next_state = get_state
  end

  def change
    @state = @next_state
  end

  private

  def live_neighbors
    neighbors.select(&:alive?)
  end

  def get_state
    if LIVE_STATES[state].include?(live_neighbors.count)
      :alive
    else
      :dead
    end
  end
end
