=begin
Write a Program to take an array as input and sort it in ascending order using Insertion Sort
=end
def insertion_sort(array,n)
    (0...n).each do |index|
        target = array[index]
        j = index - 1
        while j >= 0 && array[j] > target
            array[j+1] = array[j]
            j -=  1
        end
        array[j+1] = target
    end
end

puts "Enter the Size of your array"
n = gets.chomp.to_i
puts "Enter the elements of your array"
array = Array.new(n)
array.each_with_index do |ele,ind|
    array[ind] = gets.chomp.to_i
    
end
puts "Before Insertion sort"
array.each do |ele|
    print "#{ele} "
end
puts
insertion_sort(array,n)
puts "After applying Insertion Sort";
array.each do  |ele|
    print "#{ele} "
end