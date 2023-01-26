// Given two strings s and t of lengths m and n respectively, return the minimum window
// substring of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

// The testcases will be generated such that the answer is unique.

class Solution {
  String minWindow(String s, String t) {
    //length of t is greater than s, return empty string
    //if s == t, return s
    //set the window of t length, and check all letters are contained?

    final int tLen = t.length;
    final int sLen = s.length;

    if (s == t) return s;
    if (tLen > sLen) return '';
    for (var i = 0; i < sLen; i++) {}
  }
}
