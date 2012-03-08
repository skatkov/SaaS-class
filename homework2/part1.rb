#!/usr/bin/env ruby -wKU

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

