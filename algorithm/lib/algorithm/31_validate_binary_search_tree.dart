// Given the root of a binary tree, determine if it is a valid binary search tree (BST).

// A valid BST is defined as follows:

// The left
// subtree
//  of a node contains only nodes with keys less than the node's key.
// The right subtree of a node contains only nodes with keys greater than the node's key.
// Both the left and right subtrees must also be binary search trees.

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  //check left and right recursively
  //if root is null return true
  //left has to be smaller than parent.val but greater than node.val for right node
  //right has to be greater than node.val but smaller than node.val for left node
  bool isValidBST(TreeNode? root) {
    return validate(root, null, null);
  }

  bool validate(TreeNode? root, int? min, int? max) {
    if (root == null) {
      return true;
    }
    if ((min != null && root.val <= min) || (max != null && root.val >= max)) {
      return false;
    }

    return validate(root.left, min, root.val) &&
        validate(root.right, root.val, max);
  }
}
