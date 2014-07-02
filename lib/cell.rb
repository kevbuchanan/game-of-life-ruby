class Cell
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
    case live
    when 2
      :alive
    when 3
      :alive
    else
      :dead
    end
  end

  def get_dead_state(live)
    if live == 3
      :alive
    else
      :dead
    end
  end
end
