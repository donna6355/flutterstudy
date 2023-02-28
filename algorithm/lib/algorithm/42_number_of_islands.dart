// Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

// An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

class Solution {
  int numIslands(List<List<String>> grid) {
    int ans = 0;
    int m = grid.length, n = grid.first.length;
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (grid[i][j] == "1") {
          walk(grid, i, j);
          ans++;
        }
      }
    }

    return ans;
  }

  void walk(List<List<String>> grid, int i, int j) {
    if (i >= grid.length ||
        i < 0 ||
        j >= grid.first.length ||
        j < 0 ||
        grid[i][j] == "0") return;

    grid[i][j] = "0";

    walk(grid, i - 1, j);
    walk(grid, i, j + 1);
    walk(grid, i + 1, j);
    walk(grid, i, j - 1);
  }
}
