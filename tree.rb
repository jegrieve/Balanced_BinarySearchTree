require_relative "node.rb"
class Tree
    attr_accessor :root
    def initialize(array)
        @root = build_tree(array)
    end

    def build_tree(array)
        return if array.length == 0
        return array.first if array.length == 1
        middle = array.length / 2
        sorted_array = array.sort 
        left_sorted = sorted_array[0...middle]
        right_sorted = sorted_array[middle + 1..-1]
        root_node = Node.new(sorted_array[middle])
        root_node.left = Node.new(build_tree(left_sorted))
        if build_tree(right_sorted) != nil
        root_node.right = Node.new(build_tree(right_sorted))
        end
        return root_node
    end
end

a = Tree.new([1,2,3,4,5,6])
p a