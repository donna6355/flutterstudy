// Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.

// Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.

// Clarification: The input/output format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.

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
  String serialize(TreeNode? root) {
    //find preorder and inorder
    //convert list into string and concat two string with the divider "T"
    if (root == null) return '';
    final List<int?> preO = preorderTraversal(root);
    final List<int?> inO = inorderTraversal(root);

    return preO.join(',') + inO.join(',');
  }

  inorderTraversal(TreeNode? root) {
    const result = [];

    void traverse(TreeNode? root) {
      if (root == null) return;

      traverse(root.left);
      result.add(root.val);
      traverse(root.right);
    }

    traverse(root);
    return result;
  }

  List<int?> preorderTraversal(TreeNode? root) {
    List<int?> rootIsEmpty = root != null ? [root.val] : [];
    List<int?> rootLeft =
        root?.left != null ? preorderTraversal(root?.left) : [];
    List<int?> rootRight =
        root?.right != null ? preorderTraversal(root?.right) : [];
    return rootIsEmpty + rootLeft + rootRight;
  }

  TreeNode? deserialize(String data) {
    //divid string into two by "T"
    //convert string into list;
    if (data.isEmpty) return null;
    int idx = data.indexOf('T');
    String preS = data.substring(0, idx);
    String inS = data.substring(idx + 1);

    List<String> preList = preS.split(',');
    List<String> inList = inS.split(',');

    return buildTree(preList, inList);
  }

  TreeNode? buildTree(List<String> preorder, List<String> inorder) {
    if (preorder.isEmpty || inorder.isEmpty) return null;

    final TreeNode root = TreeNode(int.parse(preorder[0]));
    final int idx = inorder.indexOf(preorder[0]);
    root.left =
        buildTree(preorder.sublist(1, idx + 1), inorder.sublist(0, idx));
    root.right = buildTree(preorder.sublist(idx + 1), inorder.sublist(idx + 1));
    return root;
  }
}
