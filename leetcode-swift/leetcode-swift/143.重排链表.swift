//
//  143.重排链表.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/23.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个单链表 L：L0→L1→…→Ln-1→Ln ，
 将其重新排列后变为： L0→Ln→L1→Ln-1→L2→Ln-2→…

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

 示例 1:
 给定链表 1->2->3->4, 重新排列为 1->4->2->3.
 
 示例 2:
 给定链表 1->2->3->4->5, 重新排列为 1->5->2->4->3.
 */

extension Solution {
    func reorderList(_ head: ListNode?) {
        if head == nil {
            return
        }
        var fast = head
        var slow = head
        while fast?.next != nil && fast?.next?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }

        var right = slow?.next
        slow?.next = nil
        var p: ListNode?
        while right != nil {
            let tmp = right?.next
            right?.next = p
            p = right
            right = tmp
        }
        
        var q = head
        var dummy: ListNode? = ListNode(-1)
        while q != nil {
            dummy?.next = q
            dummy = dummy?.next
            q = q?.next
            
            dummy?.next = p
            dummy = dummy?.next
            p = p?.next
        }
        
        print(ListNode.printNode(node: head))
    }
}

func test143(s: Solution) {
    let nums = [1,2,3,4,5]
    let list = ListNode.buildNode(arr: nums)
    s.reorderList(list)
}
