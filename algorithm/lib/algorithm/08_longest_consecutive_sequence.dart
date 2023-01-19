// Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

// You must write an algorithm that runs in O(n) time.

import 'dart:math';

class Solution {
  int longestConsecutive(List<int> nums) {
    //sort list
    //consecutive means diff is 1
    //check n - n+1 == 1, if it is increment on currentMax
    //if currentMax is bigger than res, update res
    //if if fails, reset currentMax to 1

    if (nums.isEmpty) return 0;
    nums.sort();
    int res = 1;
    int currentMax = 1;
    int compare = nums[0];

    for (var i = 0; i < nums.length; i++) {
      if (nums[i] - compare == 1) {
        currentMax += 1;
        // if (currentMax > res) res = currentMax;
        res = max(currentMax, res);
      } else if (compare != nums[i]) {
        currentMax = 1;
      }

      compare = nums[i];
    }
    return res;
  }
}
