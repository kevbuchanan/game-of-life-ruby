class GridDisplay
  def initialize(world, size)
    @world = world
    @size = size
  end

  def show
    clear_screen
    each_row(print_new_line) do |x, y|
      show_location(x, y)
    end
  end

  private

  attr_reader :world, :size

  def clear_screen
    puts "\e[H\e[2J"
  end

  def print_new_line
    -> { puts }
  end

  def max
    size
  end

  def min
    -size
  end

  def each_row(row_end, &block)
    max.downto(min) do |y|
      min.upto(max) do |x|
        block.call(x, y)
      end
      row_end.call
    end
  end

  def show_location(x, y)
    location = location_at(x, y)
    symbol = location_symbol(location)
    print " #{symbol} "
  end

  def location_symbol(location)
    if location && location.cell.alive?
      make_green('1')
    else
      '0'
    end
  end

  def location_at(x, y)
    world.locations.find do |location|
      location.x == x && location.y == y
    end
  end

  def make_green(symbol)
    "\033[32m#{symbol}\033[0m"
  end
end

