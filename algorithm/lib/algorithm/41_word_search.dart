// Given an m x n grid of characters board and a string word, return true if word exists in the grid.

// The word can be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once.

class Solution {
  bool exist(List<List<String>> board, String word) {
    bool dfs(int i, int j, {int index = 0}) {
      if (index >= word.length) return true;
      if (i < 0 || i >= board.length) return false;
      if (j < 0 || j >= board[0].length) return false;

      var value = board[i][j];
      if (value != word[index]) return false;

      board[i][j] = '*';
      if (dfs(i - 1, j, index: index + 1)) return true;
      if (dfs(i + 1, j, index: index + 1)) return true;
      if (dfs(i, j - 1, index: index + 1)) return true;
      if (dfs(i, j + 1, index: index + 1)) return true;
      board[i][j] = value;

      return false;
    }

    for (var i = 0; i < board.length; i++) {
      for (var j = 0; j < board[i].length; j++) {
        if (board[i][j] == word[0] && dfs(i, j)) return true;
      }
    }

    return false;
  }
}
