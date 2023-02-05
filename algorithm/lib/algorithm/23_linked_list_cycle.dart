// Given head, the head of a linked list, determine if the linked list has a cycle in it.

// There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to. Note that pos is not passed as a parameter.

// Return true if there is a cycle in the linked list. Otherwise, return false.

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  bool hasCycle(ListNode? head) {
    //if it doesnt have cycle, it next will be null;
    //if it has cycle, some how two pointer running different pace will meet some point
    if (head == null) return false;
    ListNode? walker = head;
    ListNode? runner = head;
    while (runner?.next != null && runner?.next?.next != null) {
      walker = walker!.next;
      runner = runner!.next!.next;
      if (walker == runner) return true;
    }
    return false;
  }
}
