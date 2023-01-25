// You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.

// Return the length of the longest substring containing the same letter you can get after performing the above operations.

class Solution {
  int characterReplacement(String s, int k) {
    //for loop to store string and count which letter is the most frequent one
    //largestCount for most frequent letter
    //set start and end of windows
    //while looping, check if the need to change letter is greater than given k
    //if it is greater, shrink window => set start point +1, decrement one from the freq map
    //update maxLen if it is greater

    final Map<String, int> freq = {};
    int largestCount = 0;
    int start = 0;
    int maxLen = 0;

    for (var end = 0; end < s.length; end++) {
      final String str = s[end];
      freq.addAll({str: (freq[str] ?? 0) + 1});
      if (largestCount < freq[str]!) largestCount = freq[str]!;

      if (end - start + 1 - largestCount > k) {
        freq[s[start]] = freq[s[start]]! - 1;
        start += 1;
      }
      if (end - start + 1 > maxLen) maxLen = end - start + 1;
    }
    return maxLen;
  }
}
