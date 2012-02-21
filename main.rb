# This is just some sample code where I benchmarked a few things

require 'benchmark'

def karel(inputs)
  numbers = inputs 
  numbers.sort!
  duplicates = []
  numbers[0..-2].each_index{|i|
    if numbers[i] == numbers[i+1] then
      duplicates.push(numbers[i])
    end
  }
  (numbers-duplicates).inject(:+)
end

def notary(*inputs)
  numbers = *inputs
  numbers.uniq!
  numbers.inject(:+)
end

def notary_obli_dup(numbers)
  unique = numbers.uniq
  duplicators = subtract_n_from_u(numbers, unique)
  duplicators.each do |d|
    unique.delete(d)
  end
  unique.inject(:+)
end

def subtract_n_from_u(numbers, unique)
  unique.each do |u|
    numbers.slice!(numbers.index(u))
  end
  return numbers # duplicators
end

def my_uniq(numbers)
  numbers.sort!
  for i in 0..numbers.size()-2
    if numbers[i] == numbers[i+1]
      numbers[i] = nil
    end 
  end
  numbers.compact!
  numbers.inject(:+)
end



def test_karel(numbers=[1,2,4,5,7,1,2,4,1,5,6])
  time = Benchmark.measure do
    2000000.times do
      numbers = numbers #an example
      karel(numbers)
    end
  end
  time
end

def test_notary(*numbers)
  time = Benchmark.measure do
    2000000.times do
      numbers = *numbers
      notary(numbers)
    end
  end
  time
end

def test_notary_obli_dup(numbers)
  time = Benchmark.measure do
    2000000.times do
      numbers = numbers
      notary_obli_dup(numbers)
    end
  end
  time
end

def test_karel_uniq(numbers)
  time = Benchmark.measure do
    2000000.times do
      numbers = numbers
      my_uniq(numbers)
    end
  end
  time
end

example_array = [1,2,4,5,7,1,2,4,1,5,6]
puts "Example Array:   #{example_array}"
puts 
puts "Result A: #{karel(example_array)}" 
puts "Result B: #{notary_obli_dup(example_array)}"

puts "Example Array:   #{example_array}"

Process.exit

#puts "Speed for ruby sort:"
#puts test_karel example_array
puts "Speed test for uniq with sort"
puts test_karel_uniq example_array

puts "Speed for ruby unique obliterate:"
puts test_notary_obli_dup example_array
