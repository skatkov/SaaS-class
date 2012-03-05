require 'test/unit'

class TC_MyTest < Test::Unit::TestCase
	def test_palindrome_false
		assert !"hello".palindrome?
	end

	def test_palindrome_true
		assert "Madam in Eden, I'm Adam".palindrome?
	end


	def test_dollar_to_rupees
		#assert_equal 1, 1.dollar.in(:rupee)
	end

	def test_rupee_in_euro
		#assert_equal 0.037, 2.rupee.in(:dollar)
	end

	def test_yen_to_rupee
		#assert_equal 0, 2.yen.in(:rupee)
	end 

	def test_enum_palindrome_true
		assert_equal true, [1,2,3,2,1].palindrome?
	end

	def test_enum_palindrome_false
		assert_equal false, [1,2,3,2,5].palindrome?
	end

	def test_enum_palindrome_false2
		assert_equal false, [12, 21].palindrome? 
	end

	def test_enum_palindrome_true2
		assert_equal true, [12, 21, 12].palindrome?
	end
	def test_enum_new
		assert_equal true, Enumerator.new([1,2,1]).palindrome?
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
		(0..self.size/2).each {|n|  return false if self[n] != self[self.size - (n+1)]}
		true
	end
end

