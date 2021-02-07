
# Ruby Functions

## No computer portion

Repeat the index card lesson with functions from blockly. 

Why would we want to use functions? 

## Guided lesson
Show this:
[Flower example](http://www.coderclub.us/turtle/draw/w3bs6h)

Who would want to draw each petal one by one? Not me, so instead, lets use a function. 

Previously, we have written a program to prompt a user for input, repeating until they get it right. 

[1-2-3 shoot!](http://coderclub-rails.herokuapp.com/try/ruby/18u4ig8)

If we do this a lot, we might want to make a function:


```ruby
require 'iruby_helpers'
def prompt_for_string(msg,possible_vals)
  val = ''
  until possible_vals.include? val
    val = gets_prompt(msg).downcase
  end
  val
end
possible_odds = ['odd','even']
user_odd = prompt_for_string("Choose even or odd",possible_odds)
```




    "odd"



[1-2-3 shoot, revised](http://coderclub-rails.herokuapp.com/try/ruby/14z8clm)

Now we can duplicate the functions that were on the index cards.  Write a function to double the number given, and call the function.  Then write a function that adds numbers and call the function. 

**Note that gets_prompt returns a string, so call .to_i.  But this way is better:


```ruby
def add(n,m)
   return n.to_i + m.to_i
end
```




    :add



Another example of where to use functions is with the Turtle drawing. Here's a function that
draws a square:

```ruby
Turtle.draw do
  def square(size)
   colors = %w[red orange yellow green]
   4.times do | i |
     pencolor colors[i]
     forward size.to_i
     turnright 90
   end
  end
  10.times do 
    square 50
    turnright 36
    jump 10
  end
end
```

[turtle example](http://www.coderclub.us/turtle/draw/15d1qu4)

## Self guided lesson
1. Write a function in Turtle graphics that makes a shape that you want, like a flower or hexagon or whatever. Then call 
that function in a loop with jumps in between. 
[Flower example](http://www.coderclub.us/turtle/draw/w3bs6h )
1. Write an adder that takes in two numbers, adds them together, and returns the sum. Then alert the user what the solution is. 

## References
[ruby documentation](http://ruby-doc.org/core-2.2.0/)
