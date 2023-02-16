// Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.
//https://velog.io/@kjh107704/%EA%B7%B8%EB%9E%98%ED%94%84-BFS%EC%99%80-DFS
class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int kthSmallest(TreeNode? root, int k) {
    //add all element in an array
    //sort array
    //return kth element

    final List<int> list = [];
    addElement(list, root);
    list.sort();
    return list[k - 1];
  }

  void addElement(List<int> list, TreeNode? node) {
    if (node == null) return;
    list.add(node.val);
    addElement(list, node.right);
    addElement(list, node.left);
  }

  int kthSmallestOther(TreeNode? root, int k) {
    int ans = -1;
    f(TreeNode? root) {
      if (root == null) {
        return;
      }
      f(root.left);
      k--;
      if (k == 0) {
        ans = root.val;
        return;
      }
      f(root.right);
    }

    f(root);
    return ans;
  }
}
