//
//  061. 旋转链表.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/6.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。

 示例 1:
 输入: 1->2->3->4->5->NULL, k = 2
 输出: 4->5->1->2->3->NULL
 解释:
 向右旋转 1 步: 5->1->2->3->4->NULL
 向右旋转 2 步: 4->5->1->2->3->NULL
 
 示例 2:
 输入: 0->1->2->NULL, k = 4
 输出: 2->0->1->NULL
 解释:
 向右旋转 1 步: 2->0->1->NULL
 向右旋转 2 步: 1->2->0->NULL
 向右旋转 3 步: 0->1->2->NULL
 向右旋转 4 步: 2->0->1->NULL
 */

extension Solution {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        var count = 1
        var p = head
        while p?.next != nil {
            p = p?.next
            count += 1
        }
        let loop = count - (k % count)
        p?.next = head
        for _ in 0..<loop {
            p = p?.next
        }
        let newHead = p?.next
        p?.next = nil
        return newHead
    }
}

func test061(s: Solution) {
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    let node5 = ListNode(5)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    ListNode.printNode(node: s.rotateRight(node1, 2))
}
