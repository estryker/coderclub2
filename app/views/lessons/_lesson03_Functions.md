
# Functions
Functions are a great way to write re-usable code. 

## Review
(Optional) Have the students describe:

 * loops 
 * functions 
 * if/else

# Hands on lesson part 1

Human calculators

## Function 1
Double the number given

Input 1A: 7

Input 1B:  -12

Input 1C:  "Apple"

### Ruby


```ruby
def function1(number)
  return number * 2
end
```




    :function1



### C
```C

 int function1(int number) {
   return(number * 2);
 }

```
## Function 2
Add the two numbers

Input 2A:   5, 6 

Input 2B:   0, -17

Input 2C:   "Chocolate", "Vanilla"

### Ruby


```ruby
def function2(number1, number2)
  return number1 + number2
end
```




    :function2



### C
```C

 int function2(int number1, int number2) {
   return(number1 + number2);
 }

```
The job of a function is to do one specific task so that it can be reused later. 

# Hands on lesson part2

Three pairs of index cards:
Pair 1:  
  Card1A - Say "Banana"
  Card1B - When you hear "Banana",  get up and walk around your desk

Pair 2: 
  Card2A - Say "Apple"
  Card2B - When you hear "Apple", do a drum roll on your desk

Pair 3:
  Card3A - Say "Orange"
  Card3B - When you hear "Orange", get up and hop on one foot

This type of flow control is called 'Event Driven programming'

### Ruby
```ruby
 def onBanana
    walk_around_desk
 end
```

```ruby
  def onClick
     some_command
  end
```

## Self guided Lesson1 

[Play lab](http://studio.code.org/s/playlab/stage/1/puzzle/1)

[Flappy bird!](http://studio.code.org/flappy/1)


## Self Guided Lesson2 (*This will introduce some text based coding!)

[Pond game](https://blockly-games.appspot.com/pond-tutor?lang=en)


## Extra / Homework 

[Google Turtle](https://blockly-games.appspot.com/turtle?lang=en)
* point out how to save your work here

[Movie](https://blockly-games.appspot.com/movie?lang=en)

## Homework 
Use Turtle level 10 to draw a picture, and bring the link to share with the rest of the class. 

## Conclusion (5 minutes)
New concepts learned? How are event driven functions different from directly called ones?
