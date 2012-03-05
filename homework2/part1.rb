require 'test/unit'

class TC_MyTest < Test::Unit::TestCase
	def test_palindrome_false
		assert !"hello".palindrome?
	end

	def test_palindrome_true
		assert "Madam in Eden, I'm Adam".palindrome?
	end

	def test_dollar_to_rupees
		assert_equal 1, 1.dollar.in(:rupees)
	end

	def test_rupees_in_euro
		assert_equal 1, 10.rupees.in(:euro)
	end
end

class String
	def palindrome?
		str = self.downcase.gsub(/(\s|\W)/, "")
		str.reverse.eql?(str) 
	end
end