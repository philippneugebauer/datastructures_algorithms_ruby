require 'pry'
class G
  attr_accessor :nodes

  class Node
    attr_reader :name
    attr_accessor :children

    def initialize(name)
      @name = name
      @children = []
    end
  end

  class SearchNode
    attr_reader :node
    attr_accessor :visited

    def initialize(node)
      @node = node
      @visited = false
    end
  end

  def depth_first_search(name)
    search_nodes = @nodes.map {|n| SearchNode.new n}

    search_nodes.each do |s|
      visit_node search_nodes, s.node, name
    end

    return @done ? "Found" : "Not Found"
  end

  def visit_node(search_nodes, node, name)
    search_node = search_nodes.find {|s| s.node.name == node.name}
    puts "node #{node.name} visited" unless search_node.visited || @done
    if node.name == name
      @done = true
    elsif node.children.empty? || search_node.visited
      search_node.visited = true
    else
      search_node.visited = true
      node.children.map {|c| visit_node search_nodes, c, name} unless @done
    end
  end

  def breadth_first_search(name)

  end

  def initialize
    @nodes = []
    @done = false
  end

  def self.create
    graph = G.new
    graph.insert 'A'
    graph.insert 'B'
    graph.insert 'C'
    graph.insert 'D'
    graph.insert 'E'
    graph.insert 'F'
    graph.add_relation 'A', 'B'
    graph.add_relation 'B', 'C'
    graph.add_relation 'A', 'D'
    graph.add_relation 'C', 'E'
    graph.add_relation 'D', 'E'
    graph.add_relation 'E', 'F'
    graph.add_relation 'B', 'F'
    graph
  end

  def insert(name)
    @nodes << Node.new(name)
  end

  def add_relation(name1, name2)
    nodes = @nodes.select {|n| n.name == name1 || n.name == name2}
    nodes.first.children << nodes.last
    nodes.last.children << nodes.first
  end

end