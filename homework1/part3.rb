# input: ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream']
# => output: [["cars", "racs", "scar"], ["four"], ["for"],["potatoes"], ["creams", "scream"]]
# HINT: you can quickly tell if two words are anagrams by sorting their
# letters, keeping in mind that upper vs lowercase doesn't matter

require 'test/unit'

class TC_MyTest < Test::Unit::TestCase
  def test_anagrams
    assert_equal [["cars", "racs", "scar"], ["four"], ["for"],["potatoes"], ["creams", "scream"]], 
    combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream'])
  end

end

def combine_anagrams(words)
  words.sort.each {|word| puts "word: ", word}
end
