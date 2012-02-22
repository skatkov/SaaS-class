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
end

def palindrome?(string)
	str = string.downcase.gsub(/(\s|\W)/, "")
  	return str.reverse.eql?(str) 
end