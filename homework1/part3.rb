
require 'test/unit'

class TC_MyTest < Test::Unit::TestCase


  def test_anagrams_size
    assert_equal 5, combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream']).size
  end

  def test_anagrams
    anagrams = ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
    expected = [['cars', 'racs', 'scar'], ['four'], ['for'], ['potatoes'], ['creams', 'scream']
    ].sort

    # Order does not matter
    groups = combine_anagrams(anagrams).sort
    groups.each_with_index { |g, i| assert_equal expected[i].sort, g.sort }
  end

  def test_anagrams_diff_case
    anagrams = ['Cars', 'for', 'Potatoes', 'racs', 'Four','SCAR', 'creams', 'scream']
    expected = [['Cars', 'racs', 'SCAR'], ['Four'], ['for'], ['Potatoes'], ['creams', 'scream']
    ].sort

    # Order does not matter
    groups = combine_anagrams(anagrams).sort
    groups.each_with_index { |g, i| assert_equal expected[i].sort, g.sort }
  end
end

def combine_anagrams(words)
  hashMap = {}
  words.each{|word| wordHash = generateHash(word)
    # if has is same, then anagram
    hashMap.key?(wordHash)? hashMap[wordHash] += [word] : hashMap[wordHash] = [word]
  }
  return hashMap.values
end

def generateHash(word)
  wordHash = 0
  (0..(word.size-1)).each do |n| wordHash+=word.downcase[n].ord end
  return wordHash
end
