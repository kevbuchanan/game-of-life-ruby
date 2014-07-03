class World
  attr_reader :locations

  def initialize(*locations)
    @locations = locations
  end

  def tick
    update_world
    tick_locations
    change_locations
  end

  private

  def update_world
    locations.each do |location|
      location.set_neighbors(locations)
      @locations = locations | location.neighbors
    end
  end

  def tick_locations
    locations.each do |location|
      location.tick(locations)
    end
  end

  def change_locations
    locations.each(&:change)
  end
end
