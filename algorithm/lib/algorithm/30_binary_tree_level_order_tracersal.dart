// Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<List<int>> levelOrder(TreeNode? root) {
    //declare empty list for result
    //if root is null return empty list
    //if not add the list of the value of node
    //do it reculsively for right and left
    //need to set level and pass it as args and increment one
    //O(n) O(n)

    List<List<int>> res = [];

    traversalOrder(res, 0, root);
    return res;
  }

  void traversalOrder(List<List<int>> result, int level, TreeNode? root) {
    if (root == null) return;

    if (result.length == level) {
      result.add([root.val]);
    } else {
      result[level].add(root.val);
    }
    traversalOrder(result, level + 1, root.left);
    traversalOrder(result, level + 1, root.right);
  }
}
