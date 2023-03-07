// You are climbing a staircase. It takes n steps to reach the top.

// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

class Solution {
  int climbStairs(int n) {
    //n == 1 : 1;
    //n == 2 : 2(1+1;2);
    //n == 3 : 3(1+1+1, 2+1, 1+2);
    //n == 4 : 5(1+1+1+1, 2+1+1, 1+2+1, 1+1+2, 2+2);
    //n-2 + n-1
    if (n == 1) return 1;
    if (n == 2) return 2;
    List<int> totalStep = [0, 1, 2];
    for (int i = 3; i <= n; i++) {
      totalStep.add(totalStep[i - 1] + totalStep[i - 2]);
    }
    return totalStep[n];
  }
}
