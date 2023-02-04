// You are given the head of a singly linked-list. The list can be represented as:

// L0 → L1 → … → Ln - 1 → Ln
// Reorder the list to be on the following form:

// L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
// You may not modify the values in the list's nodes. Only nodes themselves may be changed.

import 'package:flutter/services.dart';

/**
 * Definition for singly-linked list.
 * class ListNode {
 *   int val;
 *   ListNode? next;
 *   ListNode([this.val = 0, this.next]);
 * }
 */

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  // void reorderList(ListNode? head) {
  //   //create reverse linked list
  //   // odd is increment way even is decrement reverse way
  //   if (head!.next == null) return;

  //   ListNode? head2 = head;
  //   ListNode? prev;
  //   int len = 0;

  //   while (head2 != null) {
  //     ListNode? next = head2.next;
  //     head2.next = prev;
  //     prev = head2;
  //     head2 = next;
  //     len++;
  //   }

  //   head2 = head;

  //   for (var i = 1; i < len; i++) {
  //     if (i.isOdd) {
  //       head!.next = prev!;
  //       prev = prev.next;
  //     } else {
  //       head!.next = head2;
  //       head2 = head2!.next;
  //     }
  //     head = head.next;
  //   }
  // }

  void reorderList(ListNode? head) {
    //Find the middle of the list
    //Reverse the half after middle  1=>2=>3=>4=>5=>6 to 1=>2=>3=>6=>5=>4
    //Start reorder one by one  1=>2=>3=>6=>5=>4 to 1=>6=>2=>5=>3=>4

    if (head == null || head.next == null) return;
    // [1, 2, 3, 4, 5];
    ListNode? p1 = head;
    ListNode? p2 = head;
    while (p2?.next != null && p2?.next?.next != null) {
      p1 = p1?.next;
      p2 = p2?.next?.next;
    }

    ListNode? preMiddle = p1;
    ListNode? preCurrent = p1?.next;
    while (preCurrent?.next != null) {
      ListNode? current = preCurrent?.next;
      preCurrent?.next = current?.next;
      current?.next = preMiddle?.next;
      preMiddle?.next = current;
    }

    p1 = head;
    p2 = preMiddle?.next;
    while (p1 != preMiddle) {
      preMiddle?.next = p2?.next;
      p2?.next = p1?.next;
      p1?.next = p2;
      p1 = p2?.next;
      p2 = preMiddle?.next;
    }
  }
}
