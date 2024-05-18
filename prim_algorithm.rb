=begin
Write a Program to take the adjacency matrix of a weighted graph as input and find the MST using Prim’s Algorithm
=end

class PriorityQueue
  attr_reader :queue

  def initialize
    @queue = []
  end

  def compare(a, b)
    # Prioritize lower weights 
    a[0] <=> b[0]
  end

  def enqueue(weight, node, parent)
    @queue << [weight, node, parent]
    heapify_up(@queue.length - 1)
  end

  def dequeue
    return nil if empty?
    swap(0, @queue.length - 1)
    popped_data = @queue.pop
    heapify_down(0)
    return popped_data
  end

  def empty?
    @queue.empty?
  end

  private

  def heapify_up(index)
    parent_index = (index - 1) / 2
    while index > 0 && compare(@queue[parent_index], @queue[index]) > 0
      swap(parent_index, index)
      index = parent_index
    end
  end

  def heapify_down(index)
    left_child_index = 2 * index + 1
    right_child_index = 2 * index + 2

    largest = index
    largest = left_child_index if left_child_index < @queue.length && compare(@queue[largest], @queue[left_child_index]) > 0
    largest = right_child_index if right_child_index < @queue.length && compare(@queue[largest], @queue[right_child_index]) > 0

    if largest != index
      swap(largest, index)
      heapify_down(largest)
    end
  end

  def swap(first, second)
    @queue[first], @queue[second] = @queue[second], @queue[first]
  end
end

class Graph
  attr_accessor :vertices, :matrix

  def initialize(vertices)
    @vertices = vertices
    @matrix = Array.new(vertices) { Array.new(vertices, 0) }
  end

  def get_matrix
    puts "Enter the adjacency matrix (row-wise, separated by spaces):"
    @vertices.times do |i|
      row_data = gets.chomp.split.map(&:to_i)  
      @matrix[i] = row_data
    end
  end

  def get_mst
    mst_set = [0] #starting point
    parent = Array.new(@vertices) { -1 }  # Keep track of parent nodes in MST
    key = Array.new(@vertices) { Float::INFINITY }  # Key values for picking minimum edge

    key[0] = 0  # Key for the starting vertex is 0

    # Create a priority queue to store {weight, node, parent} triplets
    queue = PriorityQueue.new
    @vertices.times { |i| queue.enqueue(key[i], i, nil) }  # Enqueue all nodes

    # The MST will have vertices - 1 edges
    (0...@vertices - 1).each do |count|
      u = queue.dequeue  # Get node with the minimum key
      mst_set.push(u[1])  # Add the extracted node to MST

      # Update key values and parent indices of adjacent vertices
      (0...@vertices).each do |v|
        weight = @matrix[u[1]][v]
        next if weight == 0 || mst_set.include?(v)  # Skip non-existent edges or vertices in MST

        if weight < key[v]
          key[v] = weight
          parent[v] = u[1] 
          queue.enqueue(weight, v, u[1])
        end
      end
    end

    print_mst(parent,key)
  end

  def print_mst(parent, key)
    total_weight = 0
    puts "Edge \t\t Weight"
    (1...@vertices).each do |i|
      puts "#{parent[i]} - #{i} \t\t#{key[i]}"
      total_weight += key[i]
    end
    puts "Hence total weight is : #{total_weight}"
  end
end

# Example usage


puts "Enter the vertics for the graph"
vertices = gets.chomp.to_i
graph = Graph.new(vertices)
graph.get_matrix
graph.get_mst





