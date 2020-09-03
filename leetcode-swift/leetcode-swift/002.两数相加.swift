//
//  002.两数相加.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/11.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例：
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 */

extension Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //进位
        var carry = 0
        let prev: ListNode? = ListNode(-1)
        var list1 = l1
        var list2 = l2
        var p = prev
        while list1 != nil || list2 != nil {
            let sum = (list1?.val ?? 0) + (list2?.val ?? 0) + carry
            let curr = sum % 10
            carry = sum / 10
            p?.next = ListNode(curr)
            p = p?.next
            list1 = list1?.next
            list2 = list2?.next
        }
        if carry != 0 {
            p?.next = ListNode(carry)
        }
        return prev?.next
    }
    
    func addTwoNumbers1(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        return nil
    }
}


func test002(s: Solution) {
    let node1 = ListNode.buildNode(arr: [9, 8])
    let node2 = ListNode.buildNode(arr: [1])
    ListNode.printNode(node: s.addTwoNumbers(node1, node2))
}
