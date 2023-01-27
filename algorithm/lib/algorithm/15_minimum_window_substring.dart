// Given two strings s and t of lengths m and n respectively, return the minimum window
// substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

// The testcases will be generated such that the answer is unique.

class Solution {
  String minWindow(String s, String t) {
    //length of t is greater than s, return empty string
    //if s == t, return s
    //set the window starting from t length, and check all letters are contained?

    final int tLen = t.length;
    final int sLen = s.length;
    int winSize = tLen;

    if (s == t) return s;
    if (tLen > sLen) return '';
    for (var i = 0; i <= sLen - winSize; i++) {
      final String sub = s.substring(i, i + winSize);
      bool contained = true;
      contained = containLetter(sub, t);
      for (var j = 0; j < tLen; j++) {
        if (!sub.contains(t[j])) {
          contained = false;
          break;
        }
      }
      if (contained) return sub;
      if (i == (sLen - winSize)) {
        i = 0;
        winSize += 1;
      }
    }

    return containLetter(s, t) ? s : '';
  }

  bool containLetter(String str, String comp) {
    for (var j = 0; j < comp.length; j++) {
      if (!str.contains(comp[j])) {
        return false;
      }
      str = str.replaceFirst(comp[j], "");
    }
    return true;
  }
}
