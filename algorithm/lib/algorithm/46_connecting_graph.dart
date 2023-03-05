// Given n nodes in a graph labeled from 1 to n. There is no edges in the graph at beginning.

// You need to support the following method:

// connect(a, b), an edge to connect node a and node b
// query(), Returns the number of connected component in the graph

class Solution {
  int countComponents(int n, List<List<int>> edges) {
    List<int> root = List<int>.generate(n, (idx) => idx);
    int count = n;
    for (int i = 0; i < edges.length; i++) {
      int r1 = getRoot(root, edges[i][0]);
      int r2 = getRoot(root, edges[i][1]);
      if (r1 != r2) {
        root[r1] = r2;
        count--;
      }
    }
    return count;
  }

  int getRoot(List<int> root, int i) {
    while (root[i] != i) {
      root[i] = root[root[i]];
      i = root[i];
    }
    return i;
  }
}
