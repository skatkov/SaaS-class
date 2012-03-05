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

	def test_enum_palindrome_true
		assert_equal true, [1,2,3,2,1].palindrome?
	end

	def test_enum_palindrome_false
		assert_equal false, [1,2,3,2,5].palindrome?
	end
end

class String
	def palindrome?
		str = self.downcase.gsub(/(\s|\W)/, "")
		str.reverse.eql?(str) 
	end
end

module Enumerable
	def palindrome?
		self.to_s.palindrome?
	end
end