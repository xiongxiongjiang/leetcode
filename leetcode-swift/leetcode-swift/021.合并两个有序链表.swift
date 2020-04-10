//
//  021. 合并两个有序链表.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
将两个升序链表合并为一个新的升序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
示例：
输入：1->2->4, 1->3->4
输出：1->1->2->3->4->4
*/

extension Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2
        let prev: ListNode? = ListNode(0)
        var p = prev
        while list1 != nil && list2 != nil {
            if (list1?.val ?? 0) <= (list2?.val ?? 0) {
                p?.next = list1
                list1 = list1?.next
            } else {
                p?.next = list2
                list2 = list2?.next
            }
            p = p?.next
        }
        p?.next = list1 ?? list2
        return prev!.next
    }
}


func test021(s: Solution) {
    let nodeA = ListNode(1)
    let nodeB = ListNode(2)
    let nodeC = ListNode(4)
    let nodeD = ListNode(1)
    let nodeE = ListNode(3)
    let nodeF = ListNode(4)
    nodeA.next = nodeB
    nodeB.next = nodeC
    nodeD.next = nodeE
    nodeE.next = nodeF
    ListNode.printNode(node: s.mergeTwoLists(nodeA, nodeD))
}
