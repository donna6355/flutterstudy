// You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed. All houses at this place are arranged in a circle. That means the first house is the neighbor of the last one. Meanwhile, adjacent houses have a security system connected, and it will automatically contact the police if two adjacent houses were broken into on the same night.

// Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

import 'dart:math';

class Solution {
  int rob(List<int> nums) {
    if (nums.length < 2) {
      return nums.isEmpty ? 0 : nums[0];
    }
    List<int> memo1 = [nums[0]];
    List<int> memo2 = [0, nums[1]];

    for (var i = 1; i < nums.length - 1; i++) {
      memo1[i] = max(nums[i] + (i >= 2 ? memo1[i - 2] : 0), memo1[i - 1]);
    }

    for (var i = 2; i < nums.length; i++) {
      memo2[i] = max(nums[i] + memo2[i - 2], memo2[i - 1]);
    }

    return max(memo1.removeLast(), memo2.removeLast());
  }
}
