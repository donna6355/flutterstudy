// You are given an integer array coins representing coins of different denominations and an integer amount representing a total amount of money.

// Return the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

// You may assume that you have an infinite number of each kind of coin.
import 'dart:math';

class Solution {
  int coinChange(List<int> coins, int amount) {
    const int infinity = 2147483648;
    final List<int> dp = List.generate(
      amount + 1,
      (_) => infinity,
    ); // This list tells us how many coins we need for each amount.
    dp[0] = 0; // To make 0, we need 0 coins.
    for (var coin in coins) {
      for (var i = coin; i <= amount; i++) {
        // Iterate through the entire amount from coin
        dp[i] = min(
            dp[i], dp[i - coin] + 1); // Update minimum number of needed coins.
      }
    }
    return dp[amount] == infinity ? -1 : dp[amount];
    // If the last element is Infinity, then we cannot make the amount.
  }
}
