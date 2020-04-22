//
//  092.反转链表II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/22.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。
 说明:
 1 ≤ m ≤ n ≤ 链表长度。

 示例:
 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5->NULL
 */

extension Solution {
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        if head == nil {
            return nil
        }
        
        let dummy = ListNode(0)
        dummy.next = head
        
        var pre: ListNode? = dummy
        for _ in 0..<(m - 1) {
            pre = pre?.next
        }
        
        let start: ListNode? = pre?.next
        var end: ListNode? = start?.next
        for _ in 0..<(n - m) {
            //移除end
            start?.next = end?.next
            //以end开头，把pre后面的拼在end的后面
            end?.next = pre?.next
            //拼在pre后面
            pre?.next = end
            //end后移
            end = start?.next
        }
        return dummy.next
    }
}

func test092(s: Solution) {
    let node1 = ListNode(1)
    let node2 = ListNode(2)
    let node3 = ListNode(3)
    let node4 = ListNode(4)
    let node5 = ListNode(5)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node5
    ListNode.printNode(node: s.reverseBetween(node1, 2, 4))
    
}
