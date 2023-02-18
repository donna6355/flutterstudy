// A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. Note that the path does not need to pass through the root.

// The path sum of a path is the sum of the node's values in the path.

// Given the root of a binary tree, return the maximum path sum of any non-empty path.

/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */

import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  //root is at least one node. default maxSum = root.val
  //go to the end of left or right
  //sum up and go up to the root with greater value
  //ditch subtree if the sum of subtree is negative

  int maxSum = 0;

  int maxPathSum(TreeNode? root) {
    maxSum = root!.val;
    recursiveMax(root);
    return maxSum;
  }

  int recursiveMax(TreeNode? node) {
    if (node == null) return 0;
    int left = recursiveMax(node.left);
    int right = recursiveMax(node.right);
    maxSum = max(maxSum, node.val + left + right);
    return max(0, max(node.val + left, node.val + right));
  }
}
