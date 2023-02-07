// Given the root of a binary tree, invert the tree, and return its root.

/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode? invertTree(TreeNode? root) {
    //swap left and right
    //recursively invert

    if (root != null) {
      var newLeft = root.right;
      root.right = root.left;
      root.left = newLeft;

      invertTree(root.right);
      invertTree(root.left);
    }
    return root;
  }
}
