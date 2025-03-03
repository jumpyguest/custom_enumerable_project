module Enumerable
  # Your code goes here
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    self.each do |elem|
      yield(elem)
    end
  end

  def my_each_with_index
    self.each_with_index do |elem, index|
      yield(elem, index)
    end
  end

  def my_select
    arr = []
    self.each do |elem|
      arr.push(elem) if yield elem
    end
    arr
  end

  def my_all?
    self.each do |elem|
      return false unless yield elem
    end
    return true
  end

  def my_any?
    self.each do |elem|
      return true if yield(elem)
    end
    return false
  end

  def my_none?
    self.each do |elem|
      return false if yield elem
    end
    return true
  end

  def my_count
    return self.size unless block_given?
    arr = []
    self.each do |elem|
      arr.push(elem) if yield elem
    end
    arr.size
  end

  def my_map
    arr = []
    self.each do |elem|
      arr.push(yield(elem))
    end
    arr
  end

  def my_inject(initial_value)
    self.each do |elem|
      initial_value = yield(initial_value, elem)
    end
    initial_value
  end
end
