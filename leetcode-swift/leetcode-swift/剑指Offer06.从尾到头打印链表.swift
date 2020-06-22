//
//  剑指Offer06.从尾到头打印链表.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/29.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。

 示例 1：
 输入：head = [1,3,2]
 输出：[2,3,1]
  
 限制：
 0 <= 链表长度 <= 10000
 */

extension Solution {
    func reversePrint(_ head: ListNode?) -> [Int] {
        var res = [Int]()
        if head == nil {
            return res
        }
        var head = head
        while head != nil {
            res.insert(head!.val, at: 0)
            head = head?.next
        }
        return res
    }
}

func testOffer006(s: Solution) {
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    node1.next = node2
    node2.next = node3
    print(s.reversePrint(node1))
}
