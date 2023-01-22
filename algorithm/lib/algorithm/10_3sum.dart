// Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

// Notice that the solution set must not contain duplicate triplets.

class Solution {
  //set three pointer 0,1,2
  //go thru each to the end
  //need to solve duplicate...
  List<List<int>> threeSum(List<int> nums) {
    final List<List<int>> res = [];
    int i = 0, j = i + 1, k = j + 1;
    Set dupCheck = {};
    final int numsLen = nums.length;
    do {
      // print('do loop i=${i}, j=${j}, k=${k}');
      while (j < numsLen - 1) {
        // print('first while loop i=${i}, j=${j}, k=${k}');

        while (k < numsLen) {
          // print('second while loop i=${i}, j=${j}, k=${k}');
          if (nums[i] + nums[j] + nums[k] == 0) {
            final List<int> ans = [nums[i], nums[j], nums[k]]..sort();
            final String ansStr = ans.join('');
            if (!dupCheck.contains(ansStr)) {
              res.add([nums[i], nums[j], nums[k]]..sort());
              dupCheck.add(ansStr);
            }
          }
          k++;
        }
        j++;
        k = j + 1;
      }
      i++;
      j = i + 1;
      k = j + 1;
    } while (i < numsLen - 2);
    return res;
  }
}
