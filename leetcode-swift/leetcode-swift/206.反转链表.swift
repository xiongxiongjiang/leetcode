//
//  206. 反转链表.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 反转一个单链表。
 示例:
 输入: 1->2->3->4->5->NULL
 输出: 5->4->3->2->1->NULL
 进阶:
 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？
 */

extension Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
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

func test206(s: Solution) {
    let alist = ListNode(1)
    let blist = ListNode(2)
    let clist = ListNode(3)
    let dlist = ListNode(4)

    alist.next = blist
    blist.next = clist
    clist.next = dlist
        
    ListNode.printNode(node: s.reverseList(alist))
}
