//
//  083. 删除排序链表中的重复元素.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。

示例 1:
输入: 1->1->2
输出: 1->2

示例 2:
输入: 1->1->2->3->3
输出: 1->2->3
*/

extension Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
       var temp = head
       while temp != nil {
           if temp?.next?.val == temp?.val {
               temp?.next = temp?.next?.next
           } else {
              temp = temp?.next
           }
       }
       return head
    }
}

func test083(s: Solution) {
    let nodeA = ListNode(1)
    let nodeB = ListNode(2)
    let nodeC = ListNode(2)
    let nodeD = ListNode(3)
    nodeA.next = nodeB
    nodeB.next = nodeC
    nodeC.next = nodeD
    ListNode.printNode(node: s.deleteDuplicates(nodeA))
}


class Solution83 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var p = head
        while p != nil {
            if p?.val == p?.next?.val {
                p?.next = p?.next?.next
            } else {
                p = p?.next
            }
        }
        return head
    }
}
