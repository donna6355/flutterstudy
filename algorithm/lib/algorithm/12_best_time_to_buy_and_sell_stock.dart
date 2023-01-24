// You are given an array prices where prices[i] is the price of a given stock on the ith day.

// You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

// Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
class Solution {
  int maxProfit(List<int> prices) {
    //compare n and n+1
    //if right pointer is smaller, both move one idx forward
    //if right pointer is bigger, right pointer move one idx forward till the end;
    //time limit exceeded
    int maxPrice = 0;
    for (var i = 0, j = i + 1; i <= prices.length - 2;) {
      if (prices[i] < prices[j]) {
        do {
          final int price = prices[j] - prices[i];
          if (price > maxPrice) maxPrice = price;
          j++;
        } while (j <= prices.length - 1);
      }
      i++;
      j = i + 1;
    }
    return maxPrice;
  }

  int maxProfieAnother(List<int> prices) {
    //selling has to be done in the future, that means moving forward
    //declare min and max
    //during for loop find min element and update
    //check if the profit is bigger and update max;
    int maxProfit = 0;
    int min = prices[0];
    for (var price in prices) {
      min = price < min ? price : min;
      maxProfit = (price - min) > maxProfit ? price - min : maxProfit;
    }
    return maxProfit;
  }
}
