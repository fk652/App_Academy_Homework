require 'set'

class GraphNode
  attr_reader :value
  attr_accessor :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

def bfs(starting_node, target_value)
  # assuming fully connected graph
  visited = Set.new
  queue = Queue.new

  queue.push(starting_node)
  until queue.empty?
    node = queue.pop

    return node if node.value == target_value

    node.neighbors.each do |neighbor|
      if !visited.include?(neighbor)
        queue.push(neighbor)
        visited.add(neighbor)
      end
    end
  end
  nil
end

puts bfs(a, 'b')
puts bfs(a, 'f')

graph_adjacency_list = {
  :a => [:b, :c, :e],
  :b => [],
  :c => [:b, :d],
  :d => [],
  :e => [:a],
  :f => [:e]
}

def bfs_print(graph)
  visited = Set.new
  graph.keys.each do |node|
    _bfs_print(node, graph, visited)
  end
end

def _bfs_print(node, graph, visited)
  return nil if visited.include?(node)

  puts
  queue = Queue.new
  queue.push(node)
  visited.add(node)
  
  until queue.empty?
    current_node = queue.pop
    puts current_node

    graph[current_node].each do |neighbor|
      if !visited.include?(neighbor)
        visited.add(neighbor)
        queue.push(neighbor)
      end
    end
  end
end

bfs_print(graph_adjacency_list)