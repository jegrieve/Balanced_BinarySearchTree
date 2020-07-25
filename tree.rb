require_relative "node.rb"
class Tree
    attr_accessor :root
    def initialize(array)
        @root = build_tree(array)
    end

    def build_tree(array)
        return nil if array.length == 0 
        return Node.new(array.first) if array.length == 1
        middle = array.length / 2
        sorted_array = array.sort.uniq
        left_array = sorted_array[0...middle]
        right_array = sorted_array[middle + 1..-1]
        node = Node.new(sorted_array[middle])
        node.left = build_tree(left_array)
        node.right = build_tree(right_array)
        node
    end

    def insert(value) 
        node = self.root
        while (node)
        if value > node.value
            if node.right == nil
                node.right = Node.new(value)
                return
            end
            node = node.right
        elsif node.value == value
            return
        else 
            if node.left == nil
                node.left = Node.new(value)
                return
            end
            node = node.left
        end
    end
    end


    def delete(value)

    end
end

a = Tree.new([1,2,3,5])
a.insert(9)
p a