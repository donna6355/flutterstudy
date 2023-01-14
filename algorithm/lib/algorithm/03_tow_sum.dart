// Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
// You may assume that each input would have exactly one solution, and you may not use the same element twice.
// You can return the answer in any order.

// Constraints:

// 2 <= nums.length <= 104
// -109 <= nums[i] <= 109
// -109 <= target <= 109
// Only one valid answer exists.

class Solution {
  List<int> twoSum(List<int> nums, int target) {
    final int len = nums.length;
    for (var i = 0; i < len; i++) {
      for (var j = i + 1; j < len; j++) {
        if (nums[i] + nums[j] == target) {
          return [i, j];
        }
      }
    }
    return [];
  }

  List<int> otherTwoSum(List<int> nums, int target) {
    Map<int, dynamic> numMap = {};
    int i = 0;
    for (int n in nums) {
      int val = target - n;
      if (numMap.containsKey(n)) {
        return [numMap[n], i];
      }
      numMap.addAll({val: i});
      i++;
    }
    return [];
  }

  // List<int> anotherTwoSum(List<int> nums, int target) {
  //   List<int> result = [];

  //   if (nums.reduce(max) < target && nums.length > 1000) {
  //     for (int i = nums.length - 1; i < nums.length; i--) {
  //       for (int j = nums.length - 1; j < nums.length; j--) {
  //         int sum = nums[i] + nums[j];
  //         print(sum);
  //         if (sum == target && i != j) {
  //           return result = [i, j];
  //           break;
  //         }
  //       }
  //     }
  //   } else {
  //     for (int i = 0; i < nums.length; i++) {
  //       for (int j = 0; j < nums.length; j++) {
  //         int sum = nums[i] + nums[j];
  //         print(sum);
  //         if (sum == target && i != j) {
  //           return result = [i, j];
  //           break;
  //         }
  //       }
  //     }
  //   }

  //   return result;
  // }
}
