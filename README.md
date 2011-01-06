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

### Spot Usage

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

### Deep Usage

Fsck also provides a way to use its functionality on every object in ruby.

    require "fsck/deep"

    42.gimme_succ # => 43
    ary = Array.new_array_please # => []
    
## Fsck: How does it work?

Fsck achieves its functionality by greatly abusing `method_missing`. Each time a fscked method is called, every method defined on the object is examined. The method with the longest name is assumed to be the *intended* method.

The examination process splits the word of each method name, building a regex that allows for any number of other words to be inserted wherever. If you aren't careful with the words you choose, you may unintentionally call another method.

    # you may expect this to call #each, but it will instead call #each_value
    my_hash.what_i_need_is_each_set_of_key_plus_value { |k,v| puts k }

## Origin

Fsck is named after the use of the Unix file system utility, specifically as it is applied to [profanity](http://en.wikipedia.org/wiki/Fsck#Use_as_profanity).

**NOTE:** This gem has nothing to do with the Unix file system utility

## Disclaimer

Your application will take a massive performance hit if you use this gem. The benchmark I ran on Fixnum (bench.rb) shows that using a fscked method is roughly 23485.707692308 slower. That's 23.5k. Use at your own risk.

## License
MIT License. Copyright 2011 Chris Thorn.