
=begin
Write a Program to take the adjacency matrix of a graph as input and perform Breadth-First Search
=end
def apply_bfs(matrix,n)
    
    visited = Array.new(n,false)
    queue = [0]
    visited[0] = true
    while !queue.empty?
        node = queue.shift
        print "#{node} => "
        matrix[node].each_with_index do |ele,index|
            if ele == 1 && !visited[index]
                queue << index
                visited[index] = true
            end
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
apply_bfs(matrix,n)


