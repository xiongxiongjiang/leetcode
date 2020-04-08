//
//  142. 环形链表 II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/7.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个链表，返回链表开始入环的第一个节点。 如果链表无环，则返回 null。
 为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。
 说明：不允许修改给定的链表。

 示例 1：
 输入：head = [3,2,0,-4], pos = 1
 输出：tail connects to node index 1
 解释：链表中有一个环，其尾部连接到第二个节点。


 示例 2：
 输入：head = [1,2], pos = 0
 输出：tail connects to node index 0
 解释：链表中有一个环，其尾部连接到第一个节点。


 示例 3：
 输入：head = [1], pos = -1
 输出：no cycle
 解释：链表中没有环。

 进阶：
 你是否可以不用额外空间解决此题？
 */

extension Solution {
    func detectCycle(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return nil
        }
        var fast = head
        var slow = head
        var meet: ListNode?
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                meet = fast
                break
            }
        }
        var res = head
        if meet != nil {
            while (res !== meet) {
                res = res?.next
                meet = meet?.next
            }
            return res
        }
        return nil
    }
}

func test142(s: Solution) {
    let node1 = ListNode(3)
    let node2 = ListNode(2)
    let node3 = ListNode(0)
    let node4 = ListNode(-4)
    node1.next = node2
    node2.next = node3
    node3.next = node4
    node4.next = node2
    print(s.detectCycle(node1)?.val ?? 0)
}
