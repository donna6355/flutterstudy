// A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

// Given a string s, return true if it is a palindrome, or false otherwise.

class Solution {
  bool isPalindrome(String s) {
    //convert lowercase and remove whitespace and non alpha-numeric using regExp
    //split string and reverse
    //compare if they are same

    final String removed = s.toLowerCase().replaceAll(RegExp('[^a-z0-9]'), "");
    final String reverse = removed.split('').reversed.join('');
    return removed == reverse;
  }
}
