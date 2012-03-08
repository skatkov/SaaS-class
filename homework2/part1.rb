#!/usr/bin/env ruby -wKU

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id)
    singular_currency = sanitaze(method_id)
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  def in(*arg)
  	self/ @@currencies[sanitaze(arg)]
  end
end

def sanitaze(value)
	value.to_s.gsub( /s$/, '')
end


module Enumerable
	def palindrome?
		if self.class.eql?(String) then
			checkString(self)
		elsif self.class.eql?(Range) then
			checkArray(self.to_a)
		else
			checkArray(self)
		end
	end

	def checkString(string)
		str = string.downcase.gsub(/(\s|\W)/, "")
		str.reverse.eql?(str) 
	end

	def checkArray(array)
		(0..array.size/2).each {|n|  return false if array[n] != array[array.size - (n+1)]}
		true
	end

end

