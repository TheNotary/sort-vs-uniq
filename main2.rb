def karel(inputs)
    numbers = inputs.dup
    numbers.sort!
    duplicates = []
    numbers[0..-2].each_index{|i|
    if numbers[i] == numbers[i+1] then
      duplicates.push(numbers[i])
    end
    }
    (numbers-duplicates).inject(:+)
end


example_array = [1,2,4,5,7,1,2,4,1,5,6]
puts "Example Array:   #{example_array}"
puts
puts "Result A: #{karel(example_array)}"
#puts "Result B: #{notary_obli_dup(example_array)}"

puts "Example Array:   #{example_array}"
