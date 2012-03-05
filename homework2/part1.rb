require 'test/unit'

class TC_MyTest < Test::Unit::TestCase
	def test_palindrome_false
		assert !"hello".palindrome?
	end

	def test_palindrome_true
		assert "Madam in Eden, I'm Adam".palindrome?
	end
end