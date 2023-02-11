// Given a binary search tree (BST), find the lowest common ancestor (LCA) node of two given nodes in the BST.

// According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”

// /**
//  * Definition for a binary tree node.
//  * struct TreeNode {
//  *     int val;
//  *     TreeNode *left;
//  *     TreeNode *right;
//  *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
//  * };
//  */

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Slution {
  TreeNode? lowestCommonAncestor(TreeNode? root, TreeNode p, TreeNode q) {
    //in binary search tree, left is smaller and right is greater
    //if both p and q is greater, node has to go right
    //if both p and q is smaller, node has to go left
    while (root != null) {
      if (root.val < p.val && root.val < q.val) {
        root = root.right;
      } else if (root.val > p.val && root.val > q.val) {
        root = root.left;
      } else {
        break;
      }
    }
    return root;
  }
}
