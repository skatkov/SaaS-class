require 'test/unit'

class TC_MyTest < Test::Unit::TestCase
	def test_bar_history
		f     = Foo.new
		f.bar = 1
		f.bar = 2
		#assert_equal [nil,1,2], f.bar_history
	end

end


class Class
  def attr_accessor_with_history(attr_name)
	attr_name = attr_name.to_s   # make sure it's a string
	attr_reader attr_name        # create the attribute's getter
	attr_reader attr_name+"_history" # create bar_history getter
	class_eval "your code here, use %Q for multiline strings"
  end
end

class Foo
  attr_accessor_with_history :bar
end

f     = Foo.new
f.bar = 1
f.bar = 2
f.bar_history # => if your code works, should be [nil,1,2]