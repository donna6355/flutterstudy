// Given a reference of a node in a connected undirected graph.

// Return a deep copy (clone) of the graph.

// Each node in the graph contains a value (int) and a list (List[Node]) of its neighbors.

class Node {
  int val;
  List<Node?>? neighbors;
  Node(this.val, [this.neighbors]);
}

class Solution {
  Node? cloneGraph(Node? node) {
    final Map<int, Node> visited = {};
    Node? dfs(Node? node) {
      if (node == null) return node;
      if (visited[node.val] != null) return visited[node.val];
      Node root = Node(node.val);
      visited[node.val] = root;
      if (node.neighbors != null) {
        for (var n in node.neighbors!) {
          root.neighbors!.add(dfs(n));
        }
      }

      return root;
    }

    return dfs(node);
  }
}
