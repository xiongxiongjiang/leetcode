//
//  019. 删除链表的倒数第N个节点.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/3.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个链表，删除链表的倒数第 n 个节点，并且返回链表的头结点。

 示例：
 给定一个链表: 1->2->3->4->5, 和 n = 2.
 当删除了倒数第二个节点后，链表变为 1->2->3->5.
 
 说明：
 给定的 n 保证是有效的。

 进阶：
 你能尝试使用一趟扫描实现吗？
 */

extension Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head?.next == nil {
            return nil
        }
        let prev: ListNode? = ListNode(0)
        prev?.next = head
        var fast = prev
        var slow = prev
        for _ in 0..<n {
            fast = fast?.next
        }
        while fast?.next != nil {
            fast = fast?.next
            slow = slow?.next
        }
        slow?.next = slow?.next?.next
        return prev?.next
    }
}

func test019(s: Solution) {
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    let node5 = ListNode(5)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    print(ListNode.printNode(node: s.removeNthFromEnd(node1, 2)))
}
