// Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.
// https://www.geeksforgeeks.org/tree-traversals-inorder-preorder-and-postorder/
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

//preorder = [3,9,20,15,7];
//inorder = [9,3,15,20,7];

class Solution {
  TreeNode? buildTree(List<int> preorder, List<int> inorder) {
    //preorder starts from the root
    //inorder can be divided left and right subtree by root
    //recursively divide left and right and build subtree

    if (preorder.isEmpty || inorder.isEmpty) return null;

    final TreeNode root = TreeNode(preorder[0]);
    final int idx = inorder.indexOf(preorder[0]);
    root.left =
        buildTree(preorder.sublist(1, idx + 1), inorder.sublist(0, idx));
    root.right = buildTree(preorder.sublist(idx + 1), inorder.sublist(idx + 1));
    return root;
  }
}
