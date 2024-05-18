=begin
Write a Program to take the adjacency matrix of a graph as input and perform Depth First Search
=end

def apply_dfs(node, matrix,visited = [])

  print "#{node} =>"
  visited[node] = true
  matrix[node].each_with_index do |ele, index|
    if ele == 1 && !visited[index]
        
        apply_dfs(index, matrix,visited)
        
    end
  end
  
end

puts "Enter the size of matrix"
n = gets.chomp.to_i
puts "Enter the adjacency matrix ( 0 for no connection , 1 for connection )"
matrix = []
n.times do
    matrix << gets.chomp.split.map(&:to_i)
end
puts "Entered Adjencency matrix data"
matrix.each do |row_data|
    row_data.each do |data|
        print "#{data} "
    end
    puts
end
puts "Traversing over a non directional graph"
apply_dfs(0,matrix)

