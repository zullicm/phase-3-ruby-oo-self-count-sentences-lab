# Counting Sentences Lab

## Learning Goals

- Practice defining instance methods on a class
- Practice defining instance methods that use the `self` keyword
- Learn about monkey patching

## Introduction

In this lab, you'll be adding a few instance methods to Ruby's `String` class.
We generally want to avoid altering built-in classes (especially if we are
working with other people), but in this case, we're not overwriting any methods,
and it's a good exercise in OO programming. The practice of adding methods to or
altering Ruby's built-in classes is called **monkey patching**.

The `String` class is just like any other class that we might define, such as a
`Dog` class or a `Person` class. The `String` class, however, is native to, or
included in, Ruby. So, we can add or change methods in the `String` class just
like we would in any of the classes that we define ourselves.

## Monkey Patching

Monkey patching is the practice of adding methods to or altering Ruby's built-in
classes.

Monkey patching is dangerous, and should almost never be used in real
application. What if, for example, you decide to monkey patch Ruby's `String`
class to produce a quick-fix that shortens a certain section of code in your
program? Then, months later, you run into major bugs as a result, or some of
your collaborators don't know about your monkey patch and develop bugs of their
own that they don't know the origin of? For reasons like these, monkey patching
should be considered very, very carefully. We're going to do it today, just for
fun (and to learn about `self`), but you want to avoid doing it when working on
your own programs.

To see what monkey patching looks like in action, open up IRB. Let's try
to call a method on a string that definitely doesn't exist in Ruby:

```rb
"hello".report_on_self
# NoMethodError (undefined method `report_on_self' for "hello":String)
```

We can **monkey patch** the `String` class to add an instance method, just like
we'd add an instance method to one of our own custom classes. Run this in IRB as
well:

```rb
class String
  def report_on_self
    "Self is: #{self}"
  end
end
```

Then use the `#report_on_self` method on any string:

```rb
"hello".report_on_self
# => "Self is: hello"
"this string".report_on_self
# => "Self is: this string"
```

## Instructions

You'll be coding your solution in `lib/count_sentences.rb`. We'll be
monkey-patching the built-in Ruby `String` class.

### The `#sentence?` Method

Define a instance method `#sentence?` that returns `true` if the string you are
calling it on ends in a **period** and `false` if it does not.

> **Top-Tip**: In Ruby, there's a convention to name methods that return `true`
> or `false` with a question mark (`?`) at the end, like the `Array#include?`
> or `Array#any?` methods.

You will need to use the `self` keyword in the body of this method to refer to
the string on which the method is being called. You can use the `#end_with?`
method on a string to determine what its final character is.

For example:

```ruby
"HI!".end_with?("!")
# => true
```

Call the `end_with?` method on `self` inside of your `#sentence?` method.

After implementing the `#sentence?` method, you should be able to call it
on any string:

```rb
"The weather outside is frightful.".sentence?
# true
"But the fire is so delightful".sentence?
# false
```

### The `#question?` Method

This instance method should use the `self` keyword to refer to the string on
which it is being called. This method should return true if a string ends with a
**question mark** and false if it does not.

### The `exclamation?` Method

This instance method should use the `self` keyword to refer to the string on
which it is being called. This method should return true if a string ends with
an **exclamation mark** and false if it does not.

### The `#count_sentences` Method

What we'd like to be able to do is call a `count_sentences` method on a string,
and get back a, well, count of sentences in that string. In other words:

```ruby
"This is a string! It has three sentences. Right?".count_sentences
# => 3
```

Your `#count_sentences` method should use the `self` keyword to refer to the
string on which it is called.

Think about the steps you need to go through to enact the desired behavior:

- [`#split`](http://ruby-doc.org/core-2.7.3/String.html#method-i-split) the
  string on any and all periods, question marks and exclamation marks. You can
  do this in a few different ways, but it may help to use a
  [Regular Expression][ruby regex].
- [`#count`](http://ruby-doc.org/core-2.7.3/Array.html#method-i-count) the
  number of elements that results from that `#split`.

Remember to consider edge cases, such as the following sentence:

```txt
This, well, is a sentence. This is too!! And so is this, I think? Woo...
```

What would happen if we split this sentence on the punctuation characters? We
would end up with an array that contains empty strings as well as strings
containing sentences. How would you eliminate empty strings from an array?

We recommend placing `require 'pry'` on the top of the file and placing a
`binding.pry` inside of the `#count_sentences` method to help you get this test
passing.

## Resources

- [Ruby Regular Expression Guide][ruby regex]
- [Ruby Regular Expression Editor](https://rubular.com/)

[ruby regex]: https://www.rubyguides.com/2015/06/ruby-regex/
