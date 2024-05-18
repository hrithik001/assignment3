=begin
Write a Program to take an array as input and sort it in ascending order using Bubble Sort
=end

def bubble_sort(array, n)
  for i in 0...n-1
    is_swapped = false
    for j in 0...n-1-i
      if array[j] > array[j+1]
        array[j], array[j+1] = array[j+1], array[j]
        is_swapped = true
      end
    end
    # If no elements were swapped, the array is already sorted
    break unless is_swapped
  end
end

puts "Enter the size of your array:"
n = gets.chomp.to_i
puts "Enter the elements of your array:"
array = Array.new(n) { gets.chomp.to_i }

puts "Before Bubble Sort:"
array.each { |ele| print "#{ele} " }
puts

bubble_sort(array, n)

puts "After applying Bubble Sort:"
array.each { |ele| print "#{ele} " }
puts
