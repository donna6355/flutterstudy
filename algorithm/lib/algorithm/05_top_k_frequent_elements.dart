// Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

class Solution {
  List<int> topKFrequent(List<int> nums, int k) {
    //declare map with the num as the key and count as the value
    //loop the whole nums into map and sort by value
    //convert map into list and slice into k

    Map<int, int> countMap = {};
    for (var num in nums) {
      if (countMap.containsKey(num)) {
        countMap[num] = countMap[num]! + 1;
        continue;
      }
      countMap.addAll({num: 1});
    }

    final sorted = Map.fromEntries(
        countMap.entries.toList()..sort((a, b) => b.value.compareTo(a.value)));

    return sorted.keys.toList().sublist(0, k);
  }

  List<int> topKFrequentOther(List<int> nums, int k) {
    Map<int, int> countMap = {};
    for (var num in nums) {
      countMap[num] = (countMap[num] ?? 0) + 1;
    }

    final List<int> sorted = countMap.keys.toList()
      ..sort((a, b) => countMap[b]!.compareTo(countMap[a]!));

    return sorted.sublist(0, k);
  }
}
