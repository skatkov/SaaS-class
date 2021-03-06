class Class
	def attr_accessor_with_history(attr_name)
	attr_name = attr_name.to_s   # make sure it's a string
	attr_reader attr_name        # create the attribute's getter
	attr_reader attr_name+"_history" # create bar_history getter
	class_eval %Q{
		define_method(attr_name + "=" ) do |x|
			@history = Hash[attr_name, Array.new().push(nil)] if not defined? @history
			@history[attr_name] = Array.new().push(nil) if not @history.key? attr_name
			@history[attr_name].push(x)
		end

		define_method(attr_name + "_history") do
			@history[attr_name] 
		end    
	}
	end
end

class Foo
	attr_accessor_with_history :bar
	attr_accessor_with_history :second
end

require 'test/unit'

class TC_MyTest < Test::Unit::TestCase
	
	def test_bar_history
		f     = Foo.new
		f.bar = 1
		f.bar = 2
		assert_equal [nil,1,2], f.bar_history
	end

	def test_bar_history_forget_before_value
		f     = Foo.new
		f.bar = 1
		f.bar = 2
		f     = Foo.new
		f.bar = 3
		assert_equal [nil,3], f.bar_history
	end

	def test_bar_history_with_multiple
		f = Foo.new
		f.bar = 1
		f.second = 3
		f.bar = 4

		assert_equal [nil, 1, 4], f.bar_history
		assert_equal [nil, 3], f.second_history
	end


end