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

    def delete(root, value)
        return if root == nil
        if value < root.value
            root.left = delete(root.left, value)
        elsif value > root.value
            root.right = delete(root.right, value)
        else
            if root.left == nil
                return root.right
            elsif root.right == nil
                return root.left
            end
            smallest_node = minNodeValue(root.right)
            root.value = smallest_node.value
            root.right = delete(root.right, root.value)
        end
        return root
    end

    def minNodeValue(root)
        while root.left
            root = root.left
        end
        return root
    end

    def find(root, value)
        return if root == nil
        return root if value == root.value
        if value < root.value
            find(root.left, value)
        elsif value > root.value
            find(root.right, value)  
        end
    end

    def level_order(root)
        visited_node = [root]
        discovered_queue = [root.value]
        while !visited_node.empty?
            node = visited_node.shift
            if node.left
            discovered_queue << node.left.value
            visited_node << node.left
            end
            if node.right
            discovered_queue << node.right.value
            visited_node << node.right 
            end
        end
        discovered_queue
    end

    def inorder(root)
        return [] if root == nil
        queue = []
        queue = queue + inorder(root.left)
        queue << root.value
        queue = queue + inorder(root.right)
        queue
    end

    def preorder(root)
        return [] if root == nil
        queue = []
        queue << root.value
        queue = queue + preorder(root.left)
        queue = queue + preorder(root.right)
        queue
    end
    
    def postorder(root)
        return [] if root == nil
        queue = []
        queue = queue + postorder(root.left)
        queue = queue + postorder(root.right)
        queue << root.value
        queue
    end 

    def depth(node)

    end


end

bst = Tree.new([1,2,3,4,5,6,7,8,9,10])
p bst.inorder(bst.root)

