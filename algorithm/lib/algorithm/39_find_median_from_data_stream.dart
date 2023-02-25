// The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values.

// For example, for arr = [2,3,4], the median is 3.
// For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.
// Implement the MedianFinder class:

// MedianFinder() initializes the MedianFinder object.
// void addNum(int num) adds the integer num from the data stream to the data structure.
// double findMedian() returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.

class MedianFinder {
  List<int> finder = [];
  int len = 0;

  void addNum(int num) {
    //num is greater than last el of finder just add
    // if not, find the index and insert
    if (len == 0 || finder[len - 1] <= num) {
      finder.add(num);
    } else {
      int i = finder.indexWhere((el) => el > num);
      finder.insert(i, num);
    }
    len++;
  }

  double findMedian() {
    int mid = len ~/ 2;
    if (len % 2 > 0) {
      return (finder[mid]).toDouble();
    } else {
      return (finder[mid - 1] + finder[mid]) / 2;
    }
  }
}
/**
 * Your MedianFinder object will be instantiated and called as such:
 * MedianFinder obj = MedianFinder();
 * obj.addNum(num);
 * double param2 = obj.findMedian();
 */