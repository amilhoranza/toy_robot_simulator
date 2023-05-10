class Robot
  DIRECTIONS = ['NORTH', 'EAST', 'SOUTH', 'WEST']

  def initialize
    @x = nil
    @y = nil
    @direction = nil
  end
  
  def place(x, y, direction)
    return unless valid_position?(x, y) # Ensure the placement is within table boundaries
    @x = x
    @y = y
    @direction = direction
  end

  def move
    new_x, new_y = @x, @y

    case @direction
    when 'NORTH'
      new_y -= 1
    when 'EAST'
      new_x += 1
    when 'SOUTH'
      new_y += 1
    when 'WEST'
      new_x -= 1
    end

    if valid_position?(new_x, new_y)
      @x, @y = new_x, new_y
    end
  end
  
  def left
    index = DIRECTIONS.index(@direction)
    @direction = DIRECTIONS[(index - 1) % DIRECTIONS.size]
  end

  def right
    index = DIRECTIONS.index(@direction)
    @direction = DIRECTIONS[(index + 1) % DIRECTIONS.size]
  end

  def report
    "#{@x},#{@y},#{@direction}"
  end

  private

  def valid_position?(x, y)
    x.between?(0, 4) && y.between?(0, 4)
  end
end
