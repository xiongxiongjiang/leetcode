//
//  086.分隔链表.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/23.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个链表和一个特定值 x，对链表进行分隔，使得所有小于 x 的节点都在大于或等于 x 的节点之前。
 你应当保留两个分区中每个节点的初始相对位置。

 示例:
 输入: head = 1->4->3->2->5->2, x = 3
 输出: 1->2->2->4->3->5
 */

extension Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        if head == nil {
            return head
        }
        let p1: ListNode? = ListNode(-1)
        var p1Tail = p1
        let p2: ListNode? = ListNode(-1)
        var p2Tail = p2
        var curr = head
        while curr != nil {
            if curr!.val < x {
                p1Tail?.next = ListNode(curr!.val)
                p1Tail = p1Tail?.next
            } else {
                p2Tail?.next = ListNode(curr!.val)
                p2Tail = p2Tail?.next
            }
            curr = curr?.next
        }
        p1Tail?.next = p2?.next
        return p1?.next
    }
}

func test086(s: Solution) {
    let head = ListNode.buildNode(arr: [1, 4, 3, 2, 5, 2])
    ListNode.printNode(node: s.partition(head, 3))
}
