# Write a method on String called `count_sentences` that returns the number of
# sentences in the string it is called on

class String
  def count_sentences
    ['.', '?', '!'].inject([]) do |memo, punct|
      if memo == []
        memo = self.split(punct).delete_if {|w| w.size == 1}
      else
        memo = memo.map {|w| w.split(punct)}.flatten.delete_if {|w| w.size == 1}
      end
      memo
    end.size
  end
end