// Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

// The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

// You must write an algorithm that runs in O(n) time and without using the division operation.

class Solution {
  List<int> productExceptSelf(List<int> nums) {
    //generate the list of res that has the same length of the nums with 1
    //multiply element of nums if

    List<int> res = List<int>.generate(nums.length, (index) => 1);
    for (var i = 0; i < nums.length; i++) {
      for (var j = 0; j < res.length; j++) {
        if (j == i) continue;
        res[j] *= nums[i];
      }
    }
  }
}
