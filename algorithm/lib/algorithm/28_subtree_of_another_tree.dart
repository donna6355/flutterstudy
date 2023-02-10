// Given the roots of two binary trees root and subRoot, return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.

// A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node's descendants. The tree tree could also be considered as a subtree of itself.

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
  bool isSubtree(TreeNode? root, TreeNode? subRoot) {
    //check if root is null then return subRoot is null or not;
    //reculsively compare val
    // if val is diff, check subroot with left then right
    if (root == null) return subRoot == null;
    return isEqual(root, subRoot) ||
        isSubtree(root.left, subRoot) ||
        isSubtree(root.right, subRoot);
  }

  bool isEqual(TreeNode? root1, TreeNode? root2) {
    if (root1 == null || root2 == null) return root1 == null && root2 == null;
    if (root1.val != root2.val) return false;
    return isEqual(root1.left, root2.left) && isEqual(root1.right, root2.right);
  }
}
