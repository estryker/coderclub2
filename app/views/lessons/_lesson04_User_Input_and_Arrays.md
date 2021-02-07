
# User Input/Output and Variables, Arrays

## Review - functions
What functions did we do last week?

* double the number
* add two numbers

For those who did the pond game, what functions were there? 

* scan(degrees)
* cannon(degrees,distance)

Or maybe you remember from the drawing, the flower function

**We will revisit functions later in Ruby

## Hands on Lesson

Now, instead of index cards with pre-written inputs/outputs, let the students put their input on the board. 
Write on the board: Name: with a box around it to lead into using variables. 

Pick 3 (or more) students to answer the question: 'What is your name?'. Once they write their names, 
have a 4th student say: 'Hello (name)'. Prep the 4th student saying that is their function in life to say
hello to people. 

## Ruby 
With Ruby installed on your computer, the code would look like this:

```ruby
puts "What is your name?"
name = gets
puts "Hello " + name
```

### In our Notebook environment, this is what the code looks like


```ruby
require 'iruby_helpers'
```




    true




```ruby
name = gets_prompt "What is your name?"
puts "Hello " + name
```

    Hello Coder Jane


## Guided lesson

Start here, and build an application together:

[blocklyCode](https://blockly-demo.appspot.com/static/demos/code/index.html)

Before getting to the examples, demonstrate some of the building blocks on the left side. 

While going through the examples, show the Javascript and Python code. 

### Name prompt. 
Write code that prompts the user for their name

### Name prompt 2. 
Write code that says 'Hello' to everyone, unless the user
is 'John', in which case they should say "Oh, it's you. "

Note that usually, there is an 'else' option:


```ruby
if name == 'John'
  puts "Oh, it's you John"
else
  puts "Hi " + name
end
```

    Hi Coder Jane


### Calculator
Write a program that accepts two numbers, and adds them together

### List Builder
Write a program that creates a grocery list containing three numbers.

## Lesson about variables and types
We have dealt with three types of variables:

### String
A string is a sequence of characters. 



```ruby
string = "This is a string of characters"
```




    "This is a string of characters"



### Numbers
Numbers in computer programs are usually either Integers or Real numbers (called Floating point numbers)

Integers:


```ruby
num1 = 17
```




    17



Real numbers:


```ruby
num2 = 3.5
```




    3.5



### Arrays
An Array is and ordered list of items. 


```ruby
array = [1,2,3]
array2 = ["This", "is", "an", "array"]
array3 = [1,"1",2,"two"]
```




    [1, "1", 2, "two"]



## Self guided lesson / project
Write a program that asks the user his/her name, and echo it back. Then ask what the user's
favorite color, and check to see if it is in the following list:

```
Pink, Red, Green, Yellow, Blue
```

If it is in the list, then print a message indicating that it is in the list. 

If it is not, then print a different message

## Bonus / extension to the project
Instead of querying for their favorite color, print the list of colors and have
the user select their favorite from that list.  Repeat until they have selected
one in the list. 

* Add to that a question about the user's favorite color and check to see if it is in a known list. 

## Help
[Name Prompt 1 help](https://blockly-demo.appspot.com/static/demos/code/index.html?lang=en#5in977)

[Name Prompt 2 help](https://blockly-demo.appspot.com/static/demos/code/index.html?lang=en#9md6nc)

[Calculator help](https://blockly-demo.appspot.com/static/demos/code/index.html#tirtwk)

[Grocery List](https://blockly-demo.appspot.com/static/demos/code/index.html#3qcjgd)

[Helpful example](https://blockly-demo.appspot.com/static/demos/code/index.html?lang=en#2bkzko)

## Extra / Homework
Try the pond game with variables:

[Pond game](https://blockly-games.appspot.com/pond-duck?lang=en)

[Try Ruby](http://tryruby.org)

[Kids Ruby](http://kidsruby.com/) *Download and install with your parent's permission!
