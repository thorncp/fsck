# Fsck
Fsck allows you to express your feelings while you're developing. It does this by allowing you to add words to method names on the fly.

## Installation

    gem install fsck

## Examples
Fsck allows you to have a sense of closure during your everyday development life. Here's some examples:

*A difficult problem causing you frustration? Tell it how you feel.*

    # all i want is to sum the goddamn elements
    sum = 0
    (1..10).each_fucking_element { |e| sum += e }

*Find a method that you think rocks? Show it your praise.*

    # inject rocks!
    (1..10).awesome_inject_is_awesome(&:+)

## Usage
**Spot Usage**
Fsck comes as a module that you can include wherever you want.

    require "fsck"

    class MyClass
      include Fsck

      def my_method
        42
      end
    end

    my_object = MyClass.new
    my_object.calling_my_awesome_method # => 42

**Deep Usage**
Fsck also provides a way to use its functionality on every object in ruby.

    require "fsck/deep"

    42.gimme_succ # => 43
    ary = Array.new_array_please # => []

## Origin
Fsck is named after the use of the Unix file system utility, specifically as it is applied to [profanity](http://en.wikipedia.org/wiki/Fsck#Use_as_profanity).

**NOTE:** This gem has nothing to do with the Unix file system utility

## License
MIT License. Copyright 2011 Chris Thorn.