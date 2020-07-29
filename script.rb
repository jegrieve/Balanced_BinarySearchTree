require_relative "tree.rb"

# 1. Create a binary search tree from an array of random numbers (`Array.new(15) { rand(1..100) }`)
bst = Tree.new(Array.new(15) { rand(1..100) })
bst
# 2. Confirm that the tree is balanced by calling `#balanced?`
p bst.balanced?
# 3. Print out all elements in level, pre, post, and in order
p bst.level_order
p bst.preorder
p bst.postorder
p bst.inorder
# 4. try to unbalance the tree by adding several numbers > 100
bst.insert(105)
bst.insert(150)
bst.insert(175)
bst.insert(200)
# 5. Confirm that the tree is unbalanced by calling `#balanced?`
p bst.balanced?
# 6. Balance the tree by calling `#rebalance`
bst.rebalance
# 7. Confirm that the tree is balanced by calling `#balanced?`
p bst.balanced?
# 8. Print out all elements in level, pre, post, and in order
p bst.level_order
p bst.preorder
p bst.postorder
p bst.inorder