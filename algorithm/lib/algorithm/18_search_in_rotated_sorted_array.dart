// There is an integer array nums sorted in ascending order (with distinct values).

// Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

// Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

// You must write an algorithm with O(log n) runtime complexity.

class Solution {
  int search(List<int> nums, int target) {
    //binary search
    //set mid point and check if mid point is target.
    //check mid point is in sorted order or not
    //if mid > first, it is in sorted order, remaining right side is rotated
    //if mid<first, it is rotated and remaining right side is in sorted order
    //check which part is sorted and then compare mid/target/sorted area in order to shrink which part
    //target is greater than left but smaller than mid then discard right side and vice versa

    //[6,7,0,1,2,4,5], target = 0;

    int left = 0;
    int right = nums.length - 1;

    while (left <= right) {
      int mid = (left + right) ~/ 2;
      if (nums[mid] == target) return mid;

      if (nums[mid] >= nums[left]) {
        if (target >= nums[left] && target < nums[mid]) {
          right = mid - 1;
        } else {
          left = mid + 1;
        }
      } else {
        if (target > nums[mid] && target <= nums[right]) {
          left = mid + 1;
        } else {
          right = mid - 1;
        }
      }
    }
    return -1;
  }
}
