=begin
Write a Program to take an array as input and sort it in ascending order using Merge Sort
=end
def merge_array(array, start_index, mid_index, end_index)
  size_1 = mid_index - start_index + 1
  size_2 = end_index - mid_index

  sub_array_1 = Array.new(size_1)
  sub_array_2 = Array.new(size_2)
# temperory storing in the two subarray 
  (0..size_1-1).each do |ind|
    sub_array_1[ind] = array[start_index + ind]
  end
  (0..size_2-1).each do |ind|
    sub_array_2[ind] = array[mid_index + 1 + ind]
  end

  i, j, k = 0, 0, start_index
  while i < size_1 && j < size_2
    if sub_array_1[i] <= sub_array_2[j]
      array[k] = sub_array_1[i]
      i += 1
    else
      array[k] = sub_array_2[j]
      j += 1
    end
    k += 1  # Increment k here
  end
# left out element from first sub array
  while i < size_1
    array[k] = sub_array_1[i]
    i += 1
    k += 1
  end
# left out element from second sub array
  while j < size_2
    array[k] = sub_array_2[j]
    j += 1
    k += 1
  end
end


def merge_sort(array,start_index,end_index)
    return if start_index >= end_index

    mid_index = start_index + (end_index - start_index) / 2
    merge_sort(array,start_index,mid_index)
    merge_sort(array,mid_index+1,end_index)
    merge_array(array,start_index,mid_index,end_index)

end


puts "Enter the Size of your array"
n = gets.chomp.to_i
puts "Enter the elements of your array"
array = Array.new(n)
array.each_with_index do |ele,ind|
    array[ind] = gets.chomp.to_i
    
end
puts "Before Merge sort"
array.each do |ele|
    print "#{ele} "
end
puts
merge_sort(array,0,n-1)
puts "After applying Merge Sort";
array.each do  |ele|
    print "#{ele} "
end
