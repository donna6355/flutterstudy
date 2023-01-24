// You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

// Find two lines that together with the x-axis form a container, such that the container contains the most water.

// Return the maximum amount of water a container can store.

// Notice that you may not slant the container.

// import 'dart:math';

class Solution {
  int maxArea(List<int> height) {
    //set pointer first and last
    //calculate area == width(last-first) * height(shorter length)
    //check which length is shorter and move pointer into the center

    int maxArea = 0;
    for (var i = 0, j = height.length - 1; i < j;) {
      final int area =
          (j - i) * (height[i] > height[j] ? height[j] : height[i]);
      // maxArea = max(maxArea, area);
      if (area > maxArea) maxArea = area;
      if (height[i] > height[j]) {
        j--;
      } else {
        i++;
      }
    }
    return maxArea;
  }
}
