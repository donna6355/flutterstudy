// Given an m x n board of characters and a list of strings words, return all words on the board.

// Each word must be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.

class WordNode {
  WordNode({required this.val, this.left, this.right, this.up, this.down});
  String val;
  WordNode? left;
  WordNode? right;
  WordNode? up;
  WordNode? down;
}

class Solution {
  List<String> findWords(List<List<String>> board, List<String> words) {
    //create wordnode of every elements in board and root map
    //connect left/right/up/down
    //loop words to find if find the adjacent words in board;
    Map<String, List<WordNode>> root =
        {}; //every string has to be stored to get the starting word node
    for (var i = 0; i < board.length; i++) {
      for (var j = 0; j < board[i].length; j++) {
        final String current = board[i][j];
        final node = WordNode(
          val: current,
          left: i - 1 >= 0 ? board[i - 1][j] : null,
        );
        // root[board[i][j]] =
      }
    }
  }
}
