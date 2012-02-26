
require 'test/unit'

class TC_MyTest < Test::Unit::TestCase
  def test_anagrams
    assert_equal [["cars", "racs", "scar"], ["four"], ["for"],["potatoes"], ["creams", "scream"]] , 
    combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream'])
  end

  def test_anagrams_diff_case
    assert_equal [["cars", "racs", "scar"], ["four"], ["for"],["potatoes"], ["creams", "scream"]] , 
    combine_anagrams(['caRs', 'for', 'poTatoes', 'racs', 'four','scar', 'crEams','sCream'])
  end
end

def combine_anagrams(words)
  hashMap = {}
  words.each{|word| wordHash = 0
    #create has for each word
   (0..(word.size-1)).each do |n| wordHash+=word.downcase[n] end
    # if has is same, then anagram
    hashMap.key?(wordHash)? hashMap[wordHash] += [word.downcase] : hashMap[wordHash] = [word.downcase]
  }

  return hashMap.values
end
