// Given an integer array nums, find a
// subarray
//  that has the largest product, and return the product.

// The test cases are generated so that the answer will fit in a 32-bit integer.
import 'dart:math';

class Solution {
  int maxProduct(List<int> nums) {
    /*
      m = max 
      l = left 
      r = right
      s = size
      */
    var m = nums.first;
    var l = 1;
    var r = 1;
    var s = nums.length;
    var last = s - 1;
    for (var i = 0; i < s; i++) {
      l *= nums[i];
      r *= nums[last - i];
      m = max(m, l);
      m = max(m, r);
      l = l == 0 ? 1 : l;
      r = r == 0 ? 1 : r;
    }
    return m;
  }
}
