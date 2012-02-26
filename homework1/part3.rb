# input: ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream']
# => output: [["cars", "racs", "scar"], ["four"], ["for"],["potatoes"], ["creams", "scream"]]
# HINT: you can quickly tell if two words are anagrams by sorting their
# letters, keeping in mind that upper vs lowercase doesn't matter

require 'test/unit'

class TC_MyTest < Test::Unit::TestCase
  def test_anagrams
    assert [["cars", "racs", "scar"], ["four"], ["for"],["potatoes"], ["creams", "scream"]] , 
    combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams','scream'])
  end

  def test_anagrams_diff_case
    assert [["cars", "racs", "scar"], ["four"], ["for"],["potatoes"], ["creams", "scream"]] , 
    combine_anagrams(['caRs', 'for', 'poTatoes', 'racs', 'four','scar', 'crEams','sCream'])
  end


end

def combine_anagrams(words)
  hashMap = {}
  words.each{|word| wordHash = 0
    #create has for each word
   (0..(word.size-1)).each do |n| wordHash+=word[n] end
    # if has is same, then anagram
    hashMap.key?(wordHash)? hashMap[wordHash] += [word] : hashMap[wordHash] = [word]
  }
end
