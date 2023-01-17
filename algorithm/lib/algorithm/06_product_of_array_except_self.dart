// Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

// The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

// You must write an algorithm that runs in O(n) time and without using the division operation.

class Solution {
  List<int> productExceptSelf(List<int> nums) {
    // except self means multiply left * right
    // O(n) means nested loop is not allowed then try several loops
    // how to get left or right product in O(n)? put product in the new array and multiply next el of nums by prev product

    final int numsLen = nums.length;
    final List<int> lefts = List.generate(numsLen, (index) => 1);
    final List<int> rights = List.generate(numsLen, (index) => 1);
    final List<int> res = [];

    for (var i = 0; i < numsLen; i++) {
      if (i != 0) lefts[i] = nums[i - 1] * lefts[i - 1];
    }
    // print(lefts);

    for (var i = numsLen - 1; i >= 0; i--) {
      if (i != numsLen - 1) rights[i] = nums[i + 1] * rights[i + 1];
    }
    // print(rights);

    for (var i = 0; i < numsLen; i++) {
      res.add(lefts[i] * rights[i]);
    }
    return res;
  }

  List<int> productExceptSelfOther(List<int> nums) {
    final result = List<int>.generate(nums.length, (_) => 1);

    var prefix = 1;
    for (int i = 0; i < nums.length; i++) {
      result[i] *= prefix;
      prefix *= nums[i];
    }

    var postfix = 1;
    for (int i = nums.length - 1; i >= 0; i--) {
      result[i] *= postfix;
      postfix *= nums[i];
    }

    return result;
  }
}
