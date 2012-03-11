class CartesianProduct
  include Enumerable

  def each
  	@arr1.each{ |a| @arr2.each { |b| yield a , b }}
  end

  def initialize(a, b)
  	@arr1 = a
  	@arr2 = b
  end 
end
