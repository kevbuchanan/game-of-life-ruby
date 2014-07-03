require './lib/world'
require './lib/location'
require './lib/cell'
require './lib/display'

world = World.new(
  # Glider
  GridLocation.new(-9, 9, Cell.new(:alive)),
  GridLocation.new(-8, 8, Cell.new(:alive)),
  GridLocation.new(-8, 7, Cell.new(:alive)),
  GridLocation.new(-9, 7, Cell.new(:alive)),
  GridLocation.new(-10, 7, Cell.new(:alive)),

  # Beacon
  GridLocation.new(10, 10, Cell.new(:alive)),
  GridLocation.new(10, 9, Cell.new(:alive)),
  GridLocation.new(9, 10, Cell.new(:alive)),
  GridLocation.new(9, 9, Cell.new(:alive)),
  GridLocation.new(8, 8, Cell.new(:alive)),
  GridLocation.new(7, 7, Cell.new(:alive)),
  GridLocation.new(8, 7, Cell.new(:alive)),
  GridLocation.new(7, 8, Cell.new(:alive))
)

display = GridDisplay.new(world, 10)

while true
  display.show
  world.tick
  sleep(0.5)
end

