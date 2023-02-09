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
  bool isSameTree(TreeNode? p, TreeNode? q) {
    //compare val first and left and right by recursive

    if (p == null && q == null) return true;
    if (p?.val != q?.val) return false;

    return isSameTree(p?.right, q?.right) && isSameTree(p?.left, q?.left);
  }
}
