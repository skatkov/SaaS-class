require 'test/unit'

class TestBasicOOP < Test::Unit::TestCase
    def test_dessert_cream
        ice_cream = Dessert.new 'Ice Cream', 350
        assert_not_nil ice_cream
        assert_equal 'Ice Cream', ice_cream.name
        assert_equal 350, ice_cream.calories
        assert_equal false, ice_cream.healthy?
        assert ice_cream.delicious?
    end

    def test_dessert_ice
    	ice = Dessert.new "Ice", 199
        ice.name = 'Ice'
        ice.calories = 199
        assert_equal 'Ice', ice.name
        assert_equal 199, ice.calories
        assert_equal true, ice.healthy?
        assert ice.delicious?    	
    end

    def test_jellyBean
    	jelly = JellyBean.new "RubbishJelly", 300, "candy"
    	assert_equal "candy", jelly.flavor 
    	assert_equal nil, jelly.healthy?
    	assert jelly.delicious?
    end
    'black licorice'
    def test_jellyBean
    	jelly = JellyBean.new "RubbishJelly", 300, 'black licorice'
    	assert_equal false, jelly.delicious? 
    end

end

class Dessert
	attr_accessor :name
	attr_accessor :calories

	def initialize(name, calories)
		@name = name
		@calories = calories	
	end
	def healthy?
		@calories > 200 ? false : true
	end
	def delicious?
		true
	end
end

class JellyBean < Dessert
	attr_accessor :flavor
	def initialize(name, calories, flavor)
		@flavor = flavor
		@name = name
		@calories = calories
	end
	def delicious?
		@flavor.eql?('black licorice')? false : true
	end
end