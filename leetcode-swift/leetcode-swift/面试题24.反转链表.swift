//
//  面试题24.反转链表.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/29.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 定义一个函数，输入一个链表的头节点，反转该链表并输出反转后链表的头节点。

 示例:
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
  
 限制：
 0 <= 节点个数 <= 5000
 */

extension Solution {
    func reverseList1(_ head: ListNode?) -> ListNode? {
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
