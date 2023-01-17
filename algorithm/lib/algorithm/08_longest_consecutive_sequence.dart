// Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

// You must write an algorithm that runs in O(n) time.

class Solution {
  int longestConsecutive(List<int> nums) {
    //sort list
    //check n - n+1 == 1
    //if if fails, return that index

    if (nums.isEmpty) return 0;
    nums.sort();
    int res = 1;
    int currentMax = 1;
    int compare = nums[0];

    for (var i = 0; i < nums.length; i++) {
      if (nums[i] - compare == 1) {
        currentMax += 1;
        if (currentMax > res) res = currentMax;
      } else if (compare != nums[i]) {
        currentMax = 1;
      }

      compare = nums[i];
    }
    return res;
  }
}
