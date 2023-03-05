// Given n nodes labeled from 0 to n - 1 and a list of undirected edges (each edge is a pair of nodes), write a function to check whether these edges make up a valid tree.

// For example:

// Given n = 5 and edges = [[0, 1], [0, 2], [0, 3], [1, 4]], return true.

// Given n = 5 and edges = [[0, 1], [1, 2], [2, 3], [1, 3], [1, 4]], return false.

// Show Hint Note: you can assume that no duplicate edges will appear in edges. Since all edges are undirected, [0, 1] is the same as [1, 0] and thus will not appear together in edges.

class Solution {
  List<List<int>> adj = [];
  Set vis = {};

  bool validTree(int n, List<List<int>> edges) {
    //A tree is a special graph - a connected acyclic (cycle-less) graph.
    //A graph may contain cycle(s) and nodes could be disconnected.
    //check if there is a cycle

    if (edges.length != n - 1) return false;

    for (int i = 0; i < n; i++) {
      adj.add([]);
    }

    for (var edge in edges) {
      adj[edge[0]].add(edge[1]);
      adj[edge[1]].add(edge[0]);
    }
    return dfs(0, -1) && vis.length == n;
  }

  bool dfs(int node, int parent) {
    if (vis.contains(node)) return false;
    vis.add(node);
    for (var n in adj[node]) {
      if (parent != n) {
        bool result = dfs(n, node);
        if (!result) return false;
      }
    }
    return true;
  }
}

// private List<List<Integer>> adj = new ArrayList<>();
// private Set<Integer> vis = new HashSet<>();

// boolean dfs(int node, int parent) {
//     if (vis.contains(node)) return false;
//     vis.add(node);
//     for (int neighbour : adj.get(node)) {
//         if (parent != neighbour) {
//             boolean result = dfs(neighbour, node);
//             if (!result) return false;
//         }
//     }
//     return true;
// }

// public boolean validTree(int n, int[][] edges) {

//     if (edges.length != n - 1) return false;

//     for (int i = 0; i < n; i++)
//         adj.add(new ArrayList<>());

//     for (int[] edge : edges) {
//         adj.get(edge[0]).add(edge[1]);
//         adj.get(edge[1]).add(edge[0]);
//     }
//     return dfs(0, -1) && vis.size() == n;
// }