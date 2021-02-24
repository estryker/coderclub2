puts "In turtle" # check the console!
require 'opal'
require 'math'

class Turtle
  # Make a class method called start / aliased to draw
  # This will create a new instance of Turtle, then evaluate it
  # with the given block called script.  This is what gives us
  # the syntax sugar that Python just will never have
  @@Rad = Math::PI / 180.0

  class << self
    def start(&script)
      t = self.new   
      @canvas = `document.getElementById('turtlecanvas')`
      puts "canvas: #{@canvas}"
      t.instance_eval(&script)
      t.draw
    end

    alias_method :draw, :start
  end

  def initialize
 
    @dir = 0
    @x = 300 # todo: get size of canvas and compute
    @y = 300
  end

  def draw
    #add_command "draw();"
    #send_commands
    @canvas.draw
  end

  def to_radian(degree)
    return degree * @@Rad;
  end

  def forward(num)
    rad = to_radian(@dir)
    @x += num * Math::cos(rad)
    @y += num * Math::sin(rad)  
    @canvas.line_to(@x, @y)
  end

  def backward(distance)
    turn(180)
    forward(distance)
  end
  
  def turn(degrees)
    @dir += deg;
    @dir = @dir % 360;
  end
  
  def turnleft(degrees)
    turn(-1*degrees.abs)
  end

  def turnright(degrees)
    turn(degrees.abs)
  end

  # ex: 2
  def pensize(size)
    @canvas.lineWidth = size
  end
  
  # ex: yellow
  def pencolor(color)
    @canvas.strokeStyle = color
  end
end

Turtle.draw do 
  4.times do 
    forward 50
    turnright 90
  end
end