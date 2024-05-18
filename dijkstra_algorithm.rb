=begin
Write a Program to take the adjacency matrix of a weighted graph as input and find the shortest path in the same using Dijkstra’s algorithm
=end

class Graph
  attr_accessor :vertices, :matrix

  def initialize(vertices)
    @vertices = vertices
    @matrix = Array.new(vertices) { Array.new(vertices, Float::INFINITY) }
  end

  def add_edge(u, v, weight)
    @matrix[u][v] = weight
  end

  def min_distance(dist, spt_set)
    min_val = Float::INFINITY
    min_index = nil

    (0...@vertices).each do |v|
      next if spt_set[v]  # Skip visited vertices
      if dist[v] < min_val
        min_val = dist[v]
        min_index = v
      end
    end

    return min_index
  end

  def print_solution(dist)
    puts "Vertex \t\tDistance from Source"
    (0...@vertices).each do |i|
      puts "#{i} \t\t #{dist[i]}"
    end
  end

  def dijkstra(src)
    dist = Array.new(@vertices) { Float::INFINITY}
    dist[src] = 0
    spt_set = Array.new(@vertices) { false }

    (0...@vertices).each do |count|
      u = min_distance(dist, spt_set)
      return if u.nil?  # All vertices processed
      spt_set[u] = true

      (0...@vertices).each do |v|
        next if @matrix[u][v] == Float::INFINITY || spt_set[v]  # Skip non-existent edges or visited vertices
        if dist[v] > dist[u] + @matrix[u][v]
          dist[v] = dist[u] + @matrix[u][v]
        end
      end
    end

    print_solution(dist)
  end
end

# Example usage
puts "Enter the number of vertices in the graph:"
vertices = gets.chomp.to_i

graph = Graph.new(vertices)

puts "Enter the adjacency matrix (row-wise, separated by spaces):"
(0...vertices).each do |i|
  row_data = gets.chomp.split.map(&:to_i)  # Convert to floats for weights
  graph.matrix[i] = row_data
end

puts "Enter the source vertex:"
source = gets.chomp.to_i

puts "Dijkstra's Shortest Path"
graph.dijkstra(source)
