// Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<List<int>> levelOrder(TreeNode? root) {
    List<List<int>> res = [];

    inOrderTraverse(res, 0, root);
    return res;
  }

  void inOrderTraverse(List<List<int>> result, int level, TreeNode? root) {
    if (root == null) return;

    if (result.length == level) {
      result.add([root.val]);
    } else {
      result[level].add(root.val);
    }
    inOrderTraverse(result, level + 1, root.left);
    inOrderTraverse(result, level + 1, root.right);
  }
}
