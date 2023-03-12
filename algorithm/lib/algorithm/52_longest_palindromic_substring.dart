// Given a string s, return the longest palindromic substring in s.
class Solution {
  int start = 0, maxLen = 0;
  String longestPalindrome(String inputTest) {
    if (inputTest.isEmpty) {
      return "";
    }
    if (inputTest.length < 2) {
      return inputTest;
    }
    for (int i = 0; i < inputTest.length - 1; i++) {
      helper(inputTest, i, i);
      helper(inputTest, i, i + 1);
    }
    return inputTest.substring(start, start + maxLen);
  }

  void helper(String s, int j, int k) {
    while (j >= 0 && k < s.length && s[j] == s[k]) {
      j -= 1;
      k += 1;
    }
    if (maxLen < k - j - 1) {
      start = j + 1;
      maxLen = k - j - 1;
    }
  }
}
