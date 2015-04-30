---
  tags: opening classes, oop, self, micro
  languages: ruby
  resources: 2
---

# Counting Sentences

## Description

In this lab, you'll be adding an instance method to Ruby's `String` class. We
generally want to avoid altering built-in classes (especially if we are working with
other people), but in this case, we're not overwriting any methods, and it's a good
exercise in OO programming.

What we'd like to be able to do is call a `count_sentences` method on a string, and
get back a, well, count of sentences in that string. In other words:

```ruby
"This is a string. It has three sentences. Right?".count_sentences
# => 3
```

## Instructions

Get all the tests to pass by completing the body of the `count_sentences` method
in `count_sentences.rb`.

Run the tests using the `rspec` command from the root of the project.
