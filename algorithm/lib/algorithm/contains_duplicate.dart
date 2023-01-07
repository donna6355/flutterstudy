// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

class Solution {
  bool containsDuplicate(List<int> nums) {
    //set object doesnt allow any duplicate element
    //convert nums to set and compare the length of list and set

    //T.C O(n) linear time
    //S.C O(n)

    // final int listLen = nums.length;
    // final int setLen = nums.toSet().length;
    // return listLen > setLen;

    return nums.length > nums.toSet().length;
  }
}
