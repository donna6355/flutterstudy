// Given a string s, return the number of palindromic substrings in it.

// A string is a palindrome when it reads the same backward as forward.

// A substring is a contiguous sequence of characters within the string.

class Solution {
  int countSubstrings(String s) {
    int count = 0;
    void helper(s, low, high) {
      while (low >= 0 && high < s.length && s[low] == s[high]) {
        count += 1;
        low -= 1;
        high += 1;
      }
    }

    for (var i = 0; i < s.length; i += 1) {
      helper(s, i, i); //found all single number length Palindromic
      helper(s, i, i + 1); //found all even number length Palindromic
    }
    return count;
  }
}
