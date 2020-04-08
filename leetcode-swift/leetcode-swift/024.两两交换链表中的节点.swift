//
//  024. 两两交换链表中的节点.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/7.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。
 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。
 示例:
 给定 1->2->3->4, 你应该返回 2->1->4->3.
 */

extension Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        let next = head?.next
        //头的下一个是第二个的下一个的递归
        head?.next = swapPairs(next?.next)
        //第二个的下一个是头
        next?.next = head
        return next
    }
}

func test024(s: Solution) {
    let nodeA = ListNode(1)
    let nodeB = ListNode(2)
    let nodeC = ListNode(3)
    let nodeD = ListNode(4)
    nodeA.next = nodeB
    nodeB.next = nodeC
    nodeC.next = nodeD
    ListNode.printNode(node: s.swapPairs(nodeA))
}
