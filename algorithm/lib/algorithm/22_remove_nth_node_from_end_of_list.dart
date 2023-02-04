// Given the head of a linked list, remove the nth node from the end of the list and return its head.

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    //remove nth node => change n-1's next
    //follow right by n and follow left untin right reach the end => locate left at the n-1 point
    //replace next into next.next
    final dummy = ListNode(0, head);
    ListNode? left = dummy;
    ListNode? right = head;

    while (n > 0 && right != null) {
      right = right.next;
      n--;
    }
    while (right != null) {
      right = right.next;
      left = left?.next;
    }
    left?.next = left.next?.next;
    return dummy.next;
  }
}
