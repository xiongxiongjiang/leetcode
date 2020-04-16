//
//  148.排序链表.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/16.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 在 O(n log n) 时间复杂度和常数级空间复杂度下，对链表进行排序。

 示例 1:
 输入: 4->2->1->3
 输出: 1->2->3->4
 
 示例 2:
 输入: -1->5->3->4->0
 输出: -1->0->3->4->5
 */

extension Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        var slowPrev: ListNode?
        var slow = head
        var fast = head
        while fast != nil && fast?.next != nil {
            slowPrev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        //断开链表
        slowPrev?.next = nil
        return merge2List(list1: sortList(slow), list2: sortList(head))
    }
    
    private func merge2List(list1: ListNode?, list2: ListNode?) -> ListNode? {
        var l1 = list1
        var l2 = list2
        let prev: ListNode? = ListNode(-1)
        var curr = prev
        while l1 != nil && l2 != nil {
            if l1?.val ?? 0 <= l2?.val ?? 0 {
                curr?.next = l1
                l1 = l1?.next
            } else {
                curr?.next = l2
                l2 = l2?.next
            }
            curr = curr?.next
        }
        curr?.next = l1 ?? l2
        return prev?.next
    }
}

func test148(s: Solution) {
    //-1->5->3->4->0
    let node1 = ListNode(-1)
    let node2 = ListNode(5)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    let node5 = ListNode(0)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    ListNode.printNode(node: s.sortList(node1))
}
