// A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. There are various applications of this data structure, such as autocomplete and spellchecker.

// Implement the Trie class:

// Trie() Initializes the trie object.
// void insert(String word) Inserts the string word into the trie.
// boolean search(String word) Returns true if the string word is in the trie (i.e., was inserted before), and false otherwise.
// boolean startsWith(String prefix) Returns true if there is a previously inserted string word that has the prefix prefix, and false otherwise.
class TrieNode<T> {
  TrieNode({this.key, this.parent});
  T? key;
  TrieNode<T>? parent;
  Map<T, TrieNode<T>?> children = {};
  bool isTerminating = false;
}

class Trie {
  TrieNode<int> root = TrieNode(key: null, parent: null);
  void insert(String word) {
    var current = root;

    for (var codeUnit in word.codeUnits) {
      current.children[codeUnit] ??= TrieNode(
        key: codeUnit,
        parent: current,
      );
      current = current.children[codeUnit]!;
    }

    current.isTerminating = true;
  }

  bool search(String word) {
    var current = root;
    for (var codeUnit in word.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return false;
      }
      current = child;
    }
    return current.isTerminating;
  }

  bool startsWith(String prefix) {
    var current = root;
    for (final codeUnit in prefix.codeUnits) {
      final child = current.children[codeUnit];
      if (child == null) {
        return false;
      }
      current = child;
    }

    return true;
  }
}

/**
 * Your Trie object will be instantiated and called as such:
 * Trie obj = Trie();
 * obj.insert(word);
 * bool param2 = obj.search(word);
 * bool param3 = obj.startsWith(prefix);
 */

// https://www.kodeco.com/books/data-structures-algorithms-in-dart/v1.0/chapters/11-tries

// class Trie {
//   constructor() {
//     this.root = {};
//   }

//   insert(word) {
//     let node = this.root;
//     for (let c of word) {
//       if (node[c] == null) node[c] = {};
//       node = node[c];
//     }
//     node.isWord = true;
//   }

//   traverse(word) {
//     let node = this.root;
//     for (let c of word) {
//       node = node[c];
//       if (node == null) return null;
//     }
//     return node;
//   }

//   search(word) {
//     const node = this.traverse(word);
//     return node != null && node.isWord === true;
//   }

//   startsWith(prefix) {
//     return this.traverse(prefix) != null;
//   }
// }