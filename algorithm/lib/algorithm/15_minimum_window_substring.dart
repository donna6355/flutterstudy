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
    if (tLen > sLen || !containLetter(s, t)) return '';
    for (var i = 0; i <= sLen - winSize; i++) {
      final String sub = s.substring(i, i + winSize);
      if (containLetter(sub, t)) return sub;
      if (i == (sLen - winSize)) {
        i = -1;
        winSize += 1;
      }
    }

    return s;
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

  String minWindowWorks(String s, String t) {
    var map = <int, int>{};

    for (var ch in t.codeUnits) {
      map[ch] = (map[ch] ?? 0) + 1;
    }

    int n = s.length;
    int minStart = 0;
    int minLength = n + 1;
    int charTLeft = t.length;

    for (int i = 0, j = 0; i < n; i++) {
      var ch = s.codeUnitAt(i);

      if (map.containsKey(ch)) {
        int count = map[ch]!;

        if (count > 0) charTLeft--;
        map[ch] = count - 1;
      }
      while (charTLeft == 0) {
        int curWindowLength = i - j + 1;
        if (minLength > curWindowLength) {
          minLength = curWindowLength;
          minStart = j;
        }
        var chh = s.codeUnitAt(j);
        if (map.containsKey(chh)) {
          int count = map[chh]!;
          if (count == 0) charTLeft++;
          map[chh] = count + 1;
        }
        j++;
      }
    }

    return minLength == n + 1
        ? ""
        : s.substring(minStart, minLength + minStart);
  }
}
