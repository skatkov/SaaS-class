module MoviesHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

  def sortable(title, column, id)
  	link_to title,{:sort => column} , :id => id
  end

end
