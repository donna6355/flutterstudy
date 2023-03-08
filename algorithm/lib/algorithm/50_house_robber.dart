// You are a professional robber planning to rob houses along a street. Each house has a certain amount of money stashed, the only constraint stopping you from robbing each of them is that adjacent houses have security systems connected and it will automatically contact the police if two adjacent houses were broken into on the same night.

// Given an integer array nums representing the amount of money of each house, return the maximum amount of money you can rob tonight without alerting the police.

import 'dart:math';

class Solution {
  int rob(List<int> nums) {
    //max money can get if rob current house
    int rob = 0;
    //max money can get if not rob current house
    int notRob = 0;
    for (int i = 0; i < nums.length; i++) {
      //if rob current value, previous house must not be robbed
      int curRob = notRob + nums[i];
      //if not rob ith house, take the max value of robbed (i-1)th house and not rob (i-1)th house
      notRob = max(notRob, rob);
      rob = curRob;
    }
    return max(rob, notRob);
  }
}
