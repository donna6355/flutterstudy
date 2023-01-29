// Suppose an array of length n sorted in ascending order is rotated between 1 and n times. For example, the array nums = [0,1,2,4,5,6,7] might become:

// [4,5,6,7,0,1,2] if it was rotated 4 times.
// [0,1,2,4,5,6,7] if it was rotated 7 times.
// Notice that rotating an array [a[0], a[1], a[2], ..., a[n-1]] 1 time results in the array [a[n-1], a[0], a[1], a[2], ..., a[n-2]].

// Given the sorted rotated array nums of unique elements, return the minimum element of this array.
// You must write an algorithm that runs in O(log n) time.

class Solution {
  //first is smaller than last means it doesnt need to rotate
  //for 0(log n), use binary search
  // 5,6,7,0,1,2,4 => 0
  // 6,7,0,1,2,4,5 => 6,7,0 => 0
  // 2,4,5,6,7,0,1 => 7,0,1 => 0
  // n+1 < n => n+1 is the minimum
  // n-1 > n => n is the minimum
  //middle is bigger than first, fold to the right side of the middle
  //middle is smaller than first, fold to the left side of the middle

  int findMin(List<int> nums) {
    if (nums.length == 1 || nums.first < nums.last) return nums.first;

    int left = 0;
    int right = nums.length - 1;

    while (left <= right) {
      int mid = (left + right) ~/ 2;
      if (nums[mid] > nums[mid + 1]) return nums[mid + 1];

      if (nums[mid - 1] > nums[mid]) return nums[mid];

      if (nums[mid] > nums[left]) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    return 0;
  }
}
