// Given a string s, find the length of the longest substring without repeating characters.

class Solution {
  //WRONG WAY
  // int lengthOfLongestSubstring(String s) {
  //   //convert to list with each letter
  //   //check if n+1 string is different using contains?
  //   //if diff, increment one to resLen
  //   //if same, change subString
  //   final List<String> sList = s.split('');
  //   String subString = sList[0]; //abc
  //   int resLen = 1; //3

  //   //"pwwkew"

  //   for (var i = 1; i < sList.length - 1; i++) {
  //     //4
  //     if (sList[i - 1] == sList[i]) {
  //       subString = sList[i];
  //     } else if (!subString.contains(sList[i])) {
  //       subString = s.substring(i - resLen, i + 1);
  //       resLen += 1;
  //     } else {
  //       subString = s.substring(i - resLen, i + 1);
  //     }
  //   }
  //   return resLen > subString.length ? resLen : subString.length;
  // }

  int lengthOfLongestSubstring(String s) {
    //substring string one and check if next charater is contained
    //if it contains reset the starting point i
    //if it doesnt add it to substring ad increment max if the length is greater
    
    int max = 0;
    String subStr = '';
    for (int i = 0; i < s.length; i++) {
      if (!subStr.contains(s[i])) {
        subStr += s[i];
      } else {
        if (max < subStr.length) {
          max = subStr.length;
        }
        i = i - subStr.length;
        subStr = '';
      }
    }
    return subStr.length > max ? subStr.length : max;
  }
}
