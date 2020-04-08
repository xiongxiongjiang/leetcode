//
//  203. 移除链表元素.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/8.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 删除链表中等于给定值 val 的所有节点。

 示例:

 输入: 1->2->6->3->4->5->6, val = 6
 输出: 1->2->3->4->5
 */

extension Solution {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        guard head != nil else {
            return nil
        }
        let prev: ListNode? = ListNode(-1)
        prev?.next = head
        //要从虚拟头结点开始，因为有可能第一个节点就要被移除
        var curr = prev
        while curr?.next != nil {
            if curr?.next?.val == val {
                curr?.next = curr?.next?.next
            } else {
                curr = curr?.next
            }
        }
        return prev?.next
    }
}

func test203(s: Solution) {
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(6)
    let node4 = ListNode(3)
    let node5 = ListNode(4)
    let node6 = ListNode(5)
    let node7 = ListNode(6)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    node5.next = node6
    node6.next = node7
    ListNode.printNode(node: s.removeElements(node1, 6))
}
