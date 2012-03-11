#!/usr/bin/env ruby -wKU

class Numeric
	@@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
	def method_missing(method_id)
		singular_currency = sanitaze(method_id)
		@@currencies.has_key?(singular_currency)? self * @@currencies[singular_currency] : super
	end

	def in(currency)  	
		self/ @@currencies[sanitaze(currency)]
	end
end

def sanitaze(value)
	value.to_s.gsub( /s$/, '')
end

class String
	def palindrome?
		str = self.downcase.gsub(/(\s|\W)/, "")
		str.reverse.eql?(str) 
	end
end

class Array
	def palindrome?
		self == self.reverse
	end
end

class Object
	def palindrome?
		self.to_a.palindrome?
	end
end

