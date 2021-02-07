
# Intro to text based programming

## Review
Flow control learned?
Data Structures learned?

## Guided lesson
Some quick background in Ruby, not comprehesive, but to just get the feel of the language. 
[Ruby in the Browser](http://coderclub-rails.herokuapp.com/try/ruby)

### Numbers
```ruby
 2+2
 7-4
 2 * 6
 8/2
 8/5 # ???
 8.0/5
 2.class
 2 **512

```


```ruby
2+2
```




    4



### Strings
```ruby
st = "hello"
st.upcase
st
st.start_with? 'h'
st.start_with? 'H'
st.upcase!
st.sub('L','X')
st.gsub('L','X')
st.gsub!('L','X')

```


```ruby
st = "hello"
```




    "hello"



### Arrays
```ruby
l = [1,2,3,4]
l.length
l.first
l[0]
l[1]
l.last
l[3]
l[-1]
l[0..2]
l += [9]
l.length

l = ["a", "bee","see"]
l2 = %w[a bee see]
```


```ruby
l = [1,2,3,4]
```




    [1, 2, 3, 4]



### Hashes (Dictionary/Associative Arrays) - briefly, if desired
```ruby
h = {'key1' => 1, 'key2' => 2 }
h
h['key1']
h['key3'] = 3
h
h.keys
h.values
```


```ruby
h = {'key1' => 1, 'key2' => 2 }
```




    {"key1"=>1, "key2"=>2}



### Control flow


```ruby
3.times do 
  puts "hi! "
end
```

    hi! 
    hi! 
    hi! 





    3




```ruby
3.times do | i |
  puts "hi " + i.to_s
end
```

    hi 0
    hi 1
    hi 2





    3



### Functions


```ruby
def add(num1,num2)
  return num1 + num2
end
```




    :add



## Self Guided
### Do some turtle graphics in the browser
[Ruby Turtle](http://www.coderclub.ud/turtle/draw) 

*Anyone that can draw something interesting, can try it using Sphero!

## Sphero 

### On a Mac

```ruby
Sphero.start '/dev/tty.Sphero-BRG-AMP-SPP' do
  colors = ['red','yellow','blue','green']

  speed 70
  4.times do | i |
    color colors[i]
    forward 4
    turnright 90
  end
end
```

### On Ubuntu Linux (old interface)

```ruby
require 'sphero'
s = Sphero.start '/dev/rfcomm0'
s.color('lightblue')
4.times do | i |
    s.roll(50,i*90)
    s.keep_going 4
end
```

Note to get the sphero to work on ubuntu, I had to do the following:

```
$ sudo hcitool scan

$ sudo rfcomm bind /dev/rfcomm0 MACADDR 1

```
