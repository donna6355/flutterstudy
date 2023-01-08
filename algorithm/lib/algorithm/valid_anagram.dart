// Given two strings s and t, return true if t is an anagram of s, and false otherwise.
// An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

// Constraints:

// 1 <= s.length, t.length <= 5 * 104
// s and t consist of lowercase English letters.

class Solution {
  bool isAnagram(String s, String t) {
    //sort both string and compare?

    if (s.length != t.length) return false;

    List<String> sList = s.split('')..sort();
    List<String> tList = t.split('')..sort();

    for (var i = 0; i < sList.length; i++) {
      if (sList[i] != tList[i]) return false;
    }
    return true;

    return sList.join('') == tList.join('');
  }
}
