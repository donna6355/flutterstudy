// Design a data structure that supports adding new words and finding if a string matches any previously added string.

// Implement the WordDictionary class:

// WordDictionary() Initializes the object.
// void addWord(word) Adds word to the data structure, it can be matched later.
// bool search(word) Returns true if there is any string in the data structure that matches word or false otherwise. word may contain dots '.' where dots can be matched with any letter.
class DicNode {
  Map<String, DicNode> children = {};
  bool isEnd = false;
}

class WordDictionary {
  DicNode root = DicNode();

  void addWord(String word) {
    void add(DicNode node, int i) {
      if (i == word.length) {
        node.isEnd = true;
        return;
      }
      if (node.children[word[i]] == null) node.children[word[i]] = DicNode();
      add(node.children[word[i]]!, i + 1);
    }

    add(root, 0);
  }

  bool search(String word) {
    bool find(DicNode node, int i) {
      if (i == word.length && node.isEnd) return true;
      if (i == word.length) return false;

      if (word[i] == '.') {
        for (var key in node.children.keys) {
          if (find(node.children[key]!, i + 1)) return true;
        }
        return false;
      }
      if (node.children[word[i]] == null) return false;
      return find(node.children[word[i]]!, i + 1);
    }

    return find(root, 0);
  }
}

/**
 * Your WordDictionary object will be instantiated and called as such:
 * WordDictionary obj = WordDictionary();
 * obj.addWord(word);
 * bool param2 = obj.search(word);
 */