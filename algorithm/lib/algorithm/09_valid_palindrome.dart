// A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

// Given a string s, return true if it is a palindrome, or false otherwise.

class Solution {
  bool isPalindrome(String s) {
    //convert lowercase and remove whitespace and non alpha-numeric using regExp
    //palindrome means the first half is same to the last half
    //set two pointer, one from the first and the other from the last
    //compare first and last and if they are same, increment/decrement pointers until it meets at the center

    final String removed = s.toLowerCase().replaceAll(RegExp('[^a-z0-9]'), "");
    // final String reverse = removed.split('').reversed.join('');
    // return removed == reverse;

    for (int i = 0, j = removed.length - 1; i < j; i++, j--) {
      if (removed[i] != removed[j]) return false;
    }
    return true;
  }

  bool isPalindromeOther(String s) {
    s = s.toLowerCase();
    var rx = RegExp("[^a-zA-Z0-9]");
    for (int i = 0, j = s.length - 1; i < j; i++, j--) {
      while (rx.hasMatch(s[i]) && i < j) i++;
      while (rx.hasMatch(s[j]) && i < j) j--;
      if (s[i] != s[j]) return false;
    }
    return true;
  }
}
