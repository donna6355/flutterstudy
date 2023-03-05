// There are a total of numCourses courses you have to take, labeled from 0 to numCourses - 1. You are given an array prerequisites where prerequisites[i] = [ai, bi] indicates that you must take course bi first if you want to take course ai.

// For example, the pair [0, 1], indicates that to take course 0 you have to first take course 1.
// Return true if you can finish all courses. Otherwise, return false.

class Solution {
  bool canFinish(int numCourses, List<List<int>> prerequisites) {
    final List<int> indegree = List.filled(numCourses, 0);
    final List queue = [];

    prerequisites.map((el) => indegree[el[0]] += 1);

    for (var i = 0; i < indegree.length; i++) {
      if (indegree[i] == 0) {
        queue.add(i);
      }
    }
    int count = 0;

    while (queue.isNotEmpty) {
      final c = queue.removeLast();
      count += 1;

      prerequisites.map(
        (el) {
          final course = el[0];
          final preReq = el[1];
          if (preReq == c) {
            indegree[course] -= 1;
            if (indegree[course] == 0) {
              queue.add(course);
            }
          }
        },
      );
    }
    return count == numCourses;
  }
}
