//
//  082. 删除排序链表中的重复元素 II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/7.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个排序链表，删除所有含有重复数字的节点，只保留原始链表中 没有重复出现 的数字。

 示例 1:
 输入: 1->2->3->3->4->4->5
 输出: 1->2->5
 
 示例 2:
 输入: 1->1->1->2->3
 输出: 2->3
 */

extension Solution {
    func deleteDuplicates2(_ head: ListNode?) -> ListNode? {
        let prev: ListNode? = ListNode(-1)
        prev?.next = head
        var curr: ListNode? = prev
        while curr?.next != nil && curr?.next?.next != nil {
            if curr?.next?.val == curr?.next?.next?.val {
                var tmp = curr?.next
                while tmp != nil && tmp?.next != nil && tmp?.val == tmp?.next?.val {
                    //找到最后一个相同的节点
                    tmp = tmp?.next
                }
                //直接把头的下个一个拼上下一个不同的节点
                curr?.next = tmp?.next
            } else {
                curr = curr?.next
            }
        }
        return prev?.next
    }
}

func test082(s: Solution) {
    let nodeA = ListNode(1)
    let nodeB = ListNode(2)
    let nodeC = ListNode(2)
    let nodeD = ListNode(3)
    nodeA.next = nodeB
    nodeB.next = nodeC
    nodeC.next = nodeD
    ListNode.printNode(node: s.deleteDuplicates2(nodeA))
}
