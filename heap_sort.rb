=begin
Write a Program to take an array as input and sort it in ascending order using Heap Sort

=end
def heapify(array,n,index)
    largest = index
    left = 2*index + 1
    right = 2*index + 2
    if left < n && array[largest] < array[left]
        largest = left
    end
    if right < n && array[largest] < array[right]
        largest = right
    end
    if largest != index
        array[index],array[largest]=array[largest],array[index]
        heapify(array,n,largest)
    end

end
def heap_sort(array,n)
    ind = n / 2 - 1
    while ind >= 0
        heapify(array,n,ind)
        ind -= 1
    end
    ind = n - 1
    while ind >= 0
        array[0],array[ind]=array[ind],array[0]
        heapify(array,ind,0)
        ind -= 1
    end
end
puts "Enter the Size of your array"
n = gets.chomp.to_i
puts "Enter the elements of your array"
array = Array.new(n)
array.each_with_index do |ele,ind|
    array[ind] = gets.chomp.to_i
    
end
puts "Before Heap sort"
array.each do |ele|
    print "#{ele} "
end
puts
heap_sort(array,n)
puts "After applying Heap Sort";
array.each do  |ele|
    print "#{ele} "
end