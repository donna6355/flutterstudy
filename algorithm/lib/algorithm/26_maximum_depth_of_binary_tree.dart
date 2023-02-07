// Given the root of a binary tree, return its maximum depth.

// A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int maxDepth(TreeNode? root) {
    //root is null return 0
    //if not, increment count
    //check left and right are null or not and increment count
    //add greater int to count
    //O(n),O(n)
    int count = 0;
    if (root == null) return count;
    count++;
    int left = maxDepth(root.left);
    int right = maxDepth(root.right);

    return count + (left > right ? left : right);
  }
}
