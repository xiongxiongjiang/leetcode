//
//  141. 环形链表.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/2.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

extension Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return false
        }
        var fast = head
        var slow = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if (fast === slow) {
                return true
            }
        }
        return false
    }
}

func test141(s: Solution) {
    let node1 = ListNode(3)
    let node2 = ListNode(2)
    let node3 = ListNode(0)
    let node4 = ListNode(-4)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node2
    print(s.hasCycle(node1))
}
