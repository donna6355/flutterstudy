// Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.
// https://www.geeksforgeeks.org/tree-traversals-inorder-preorder-and-postorder/
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode? buildTree(List<int> preorder, List<int> inorder) {}
}
