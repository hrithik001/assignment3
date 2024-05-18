=begin
Write a Program to take an array as input and sort it in ascending order using Quick Sort (Divide and Conquer)
=end
def partition(array,start_index,end_index)
    pivot = array[end_index]
    ind = start_index - 1
    (start_index..end_index).each do |index|
        if array[index] < pivot
            ind += 1
            array[ind],array[index]=array[index],array[ind]
        end
    end
    array[ind+1],array[end_index] = array[end_index],array[ind+1]
    return ind + 1
end
def quick_sort(array,start_index,end_index)
    if start_index < end_index 
        pivot_index = partition(array,start_index,end_index)
        quick_sort(array,start_index,pivot_index-1)
        quick_sort(array,pivot_index+1,end_index)
    end
end


puts "Enter the Size of your array"
n = gets.chomp.to_i
puts "Enter the elements of your array"
array = Array.new(n)
array.each_with_index do |ele,ind|
    array[ind] = gets.chomp.to_i
    
end
puts "Before Quick sort"
array.each do |ele|
    print "#{ele} "
end
puts
quick_sort(array,0,n-1)
puts "After applying Quick Sort";
array.each do  |ele|
    print "#{ele} "
end