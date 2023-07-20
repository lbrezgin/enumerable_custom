module Enumerable
  def my_each
    for item in self
      yield(item)
    end
  end

  def my_each_with_index
    for index in 0..self.length-1
      yield(self[index], index)
    end
    self
  end

  def my_select
    array = []
    for item in self
      if yield(item) == true
        array << item
      end
    end
    array
  end

  def my_all?
    result = true
    for item in self
      if yield(item) != true
        result = false
      end
    end
    result
  end

  def my_any?
    result = false
    for item in self
      if yield(item) == true
        result = true
      end
    end
    result
  end

  def my_none?
    result = true
    for item in self
      if yield(item) == true
        result = false
      end
    end
    result
  end

  def my_count
    counter = 0
    if block_given?
      for item in self
        if yield(item) == true
          counter += 1
        end
      end
      counter
    else
      return self.size
    end
  end

  def my_map
    new_array = []
    for item in self
      new_array << yield(item)
    end
    new_array
  end

  def my_inject(arg=0)
    count = arg
    for item in self
      count = yield(count, item)
    end
    count
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  include Enumerable
end


