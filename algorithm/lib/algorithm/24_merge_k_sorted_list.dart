// You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

// Merge all the linked-lists into one sorted linked-list and return it.

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? mergeKLists(List<ListNode?> lists) {
    //if lists is empty return null
    //if lists length is 1 return first listNode
    //merge two list first and then next two...

    if (lists.isEmpty) return null;
    if (lists.length == 1) return lists[0];
    return lists.reduce(mergeTwoLists);
  }

  ListNode? mergeTwoLists(ListNode? l1, ListNode? l2) {
    ListNode? l3 = ListNode();
    ListNode? curr = l3;

    while (l1 != null && l2 != null) {
      if (l1.val < l2.val) {
        curr?.next = l1;
        l1 = l1.next;
      } else {
        curr?.next = l2;
        l2 = l2.next;
      }
      curr = curr?.next;
    }

    curr?.next = l1 ?? l2;
    return l3.next;
  }
}
