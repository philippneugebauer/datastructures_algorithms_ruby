class Bst
  class Node
    attr_reader :value
    attr_accessor :left_child, :right_child

    def initialize(value)
      @value = value
    end
  end

  def self.create
    b = Bst.new
    b.insert 10
    b.insert 20
    b.insert 30
    b.insert 5
    b.insert 8
    b.insert 22
    b.insert 23
    b.insert 36
    b
  end

  def initialize
    @root = nil
  end

  def insert(value)
    if @root.nil?
      @root = Node.new value
    else
      find_position_and_insert value, @root
    end
  end

  def find(value)
    find_position value, @root
  end

  def remove(value)
    node = find_position(value, root)
    return nil if node.nil?

    if node.left_child && node.left_child.value == value
      handle_removal(node, node.left_child, :left_child=)
    elsif  node.right_child && node.right_child.value == value
      handle_removal(node, node.right_child, :right_child=)
    end
  end

  def in_order_traversal(node = @root)
    return unless node
    in_order_traversal(node.left_child)
    puts "node #{node.value} visited"
    in_order_traversal(node.right_child)
  end

  def pre_order_traversal(node = @root)
    return unless node
    puts "node #{node.value} visited"
    pre_order_traversal(node.left_child)
    pre_order_traversal(node.right_child)
  end

  def post_order_traversal(node = @root)
    return unless node
    post_order_traversal(node.left_child)
    post_order_traversal(node.right_child)
    puts "node #{node.value} visited"
  end

  private

  def handle_removal(parent_node, node, deletion_side)
    if node.left_child.nil? && node.right_child.nil?
      parent_node.send deletion_side, nil
    elsif node.left_child.nil?
      parent_node.send deletion_side, node.right_child
    elsif node.right_child.nil?
      parent_node.send deletion_side, node.left_child
    else
      parent_node.send deletion_side, find_leftmost_in_right_subtree(node)
    end
  end

  def find_leftmost_in_right_subtree(node)
    parent = node
    child = node.right_child
    while !child.left_child.nil?
      parent = child
      child = child.left_child
    end
    parent.left_child = child.right_child
    child.right_child = nil
    return child
  end

  def find_parent_position(value, node)
    return nil if node.left_child.nil? && node.right_child.nil?
    return node if (node.left_child && node.left_child.value == value) || (node.right_child && node.right_child.value == value)

    if value >= node.value
      find_position value, node.right_child
    else
      find_position value, node.left_child
    end
  end

  def find_position(value, node)
    return node if value == node.value
    return nil if node.left_child.nil? && node.right_child.nil?

    if value >= node.value
      find_position value, node.right_child
    else
      find_position value, node.left_child
    end
  end

  def find_position_and_insert(value, node)
    if value >= node.value
      return insert_new_leaf(value, node, :right_child=) if node.right_child.nil?
      find_position_and_insert value, node.right_child
    else
      return insert_new_leaf(value, node, :left_child=) if node.left_child.nil?
      find_position_and_insert value, node.left_child
    end
  end

  def insert_new_leaf(value, node, leaf_side)
    node.send leaf_side, Node.new(value)
  end

end