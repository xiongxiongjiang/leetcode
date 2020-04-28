//
//  234.回文链表.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/28.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 请判断一个链表是否为回文链表。

 示例 1:

 输入: 1->2
 输出: false
 示例 2:

 输入: 1->2->2->1
 输出: true
 进阶：
 你能否用 O(n) 时间复杂度和 O(1) 空间复杂度解决此题？
 */

extension Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil || head?.next == nil {
            return true
        }
        let prev: ListNode? =  ListNode(-1)
        prev?.next = head
        var fast = prev
        var slow = prev
        while fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        var right: ListNode?
        if fast?.next != nil {
            //偶数
            right = slow?.next?.next
        } else {
            //奇数
            right = slow?.next
        }
        slow?.next = nil
        var head = reserveListNode(head: head)
        while head != nil {
            if head?.val != right?.val {
                return false
            }
            head = head?.next
            right = right?.next
        }
        return true
    }
    
    private func reserveListNode(head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var curr = head
        while curr != nil {
            let tmp = curr?.next
            curr?.next = prev
            prev = curr
            curr = tmp
        }
        return prev
    }
}

func test234(s: Solution) {
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(2)
    let node5 = ListNode(1)
    let node6 = ListNode(2)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    node5.next = node6
    print(s.isPalindrome(node1))
}
