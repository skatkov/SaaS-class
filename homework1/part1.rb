# Stanislav K. homework for SaaS course.
# www.coursera.org/saas

require 'test/unit'

class TC_MyTest < Test::Unit::TestCase 

  def test_panama_true
    assert palindrome?("A man, a plan, a canal -- Panama")
  end

  def test_madam_true
    assert palindrome?("Madam, I'm Adam!")
  end

  def test_abracadabra_false
    assert_equal false, palindrome?("Abracadabra") 
  end

  def test_count_panama
    assert_equal ({'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}), count_words("A man, a plan, a canal -- Panama")
  end

  def test_count_doo
    assert_equal ({'doo' => 3, 'bee' => 2}), count_words("Doo bee doo bee doo") 
  end 
end

#actual implementation

def palindrome?(string)
  str = string.downcase.gsub(/(\s|\W)/, "")
    return str.reverse.eql?(str) 
end

def count_words(string)
  h = Hash.new
  string.downcase.gsub(/\W/, " ").split(/\b/).each {|str| h.key?(str)? h[str] += 1 : h[str] = 1 if !str.strip.empty? }    
  return h
end