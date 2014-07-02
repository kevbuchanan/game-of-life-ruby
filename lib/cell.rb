class Cell
  LIVE = [2, 3]
  DEAD = [3]

  attr_reader :state, :next_state

  def initialize(state = :dead)
    @state = state
  end

  def alive?
    state == :alive
  end

  def tick(live_neighbors)
    @next_state = get_state(live_neighbors)
  end

  def change
    @state = @next_state
  end

  private

  def get_state(live)
    if alive?
      get_alive_state(live)
    else
      get_dead_state(live)
    end
  end

  def get_alive_state(live)
    if LIVE.include?(live)
      :alive
    else
      :dead
    end
  end

  def get_dead_state(live)
    if DEAD.include?(live)
      :alive
    else
      :dead
    end
  end
end
