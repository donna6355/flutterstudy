// Given an array of strings strs, group the anagrams together. You can return the answer in any order.

// An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    //declare map for index and list for result; map has comparable str as key and index of res list as value
    //sort string in alphabetical order
    //check if sorted string is included in the map's key
    //if it has, add origin string in the list at the index provided by map's value
    //if not, add new list to the res list and add map with the comparable str as key and the length of map as the index
    //O(n)

    Map<String, int> index = {};
    List<List<String>> res = [];

    for (var str in strs) {
      final List<String> strList = str.split("")..sort();
      final String sortedStr = strList.toString();
      if (index.containsKey(sortedStr)) {
        res[index[sortedStr]!].add(str);
        continue;
      }
      res.add([str]);
      index.addAll({sortedStr: index.length});
    }

    return res;
  }

  List<List<String>> groupAnagramsSecond(List<String> strs) {
    Map<String, List<String>> index = {};

    for (var str in strs) {
      final List<String> strList = str.split("")..sort();
      final String sortedStr = strList.toString();
      if (index.containsKey(sortedStr)) {
        index[sortedStr]!.add(str);
        continue;
      }
      index.addAll({
        sortedStr: [str]
      });
    }

    return index.values.toList();
  }
}
