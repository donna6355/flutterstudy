// There is an m x n rectangular island that borders both the Pacific Ocean and Atlantic Ocean. The Pacific Ocean touches the island's left and top edges, and the Atlantic Ocean touches the island's right and bottom edges.

// The island is partitioned into a grid of square cells. You are given an m x n integer matrix heights where heights[r][c] represents the height above sea level of the cell at coordinate (r, c).

// The island receives a lot of rain, and the rain water can flow to neighboring cells directly north, south, east, and west if the neighboring cell's height is less than or equal to the current cell's height. Water can flow from any cell adjacent to an ocean into the ocean.

// Return a 2D list of grid coordinates result where result[i] = [ri, ci] denotes that rain water can flow from cell (ri, ci) to both the Pacific and Atlantic oceans.

class Solution {
  List<List<int>> pacificAtlantic(List<List<int>> heights) {
    if (heights.isEmpty) return heights;
    final int y = heights.length;
    final int x = heights[0].length;
    List<List<int>> ans = [];
    List<List<int>> dp = List.filled(x, List.filled(y, 0));

    void dfs(int i, int j, int w, int h) {
      if ((dp[i][j] && w) || heights[i][j] < h) return;
      dp[i][j] += w;
      h = heights[i][j];
      if (dp[i][j] == 3) ans.add([i, j]);
      if (i + 1 < y) dfs(i + 1, j, w, h);
      if (i > 0) dfs(i - 1, j, w, h);
      if (j + 1 < x) dfs(i, j + 1, w, h);
      if (j > 0) dfs(i, j - 1, w, h);
    }

    for (var i = 0; i < y; i++) {
      dfs(i, 0, 1, heights[i][0]);
      dfs(i, x - 1, 2, heights[i][x - 1]);
    }
    for (var j = 0; j < x; j++) {
      dfs(0, j, 1, heights[0][j]);
      dfs(y - 1, j, 2, heights[y - 1][j]);
    }
    return ans;
  }
}
