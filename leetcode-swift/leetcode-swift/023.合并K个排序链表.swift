//
//  023.合并K个排序链表.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/10.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。
 示例:
 输入:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 输出: 1->1->2->3->4->4->5->6
 */

extension Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        let count = lists.count
        if count == 0 {
            return nil
        }
        if count == 1 {
            return lists.first!
        }
        var interval = 1
        var newList = lists
        while interval < count {
            //二分法
            for i in stride(from: 0, to: count - interval, by: interval * 2) {
                newList[i] = merge2List(newList[i], newList[i + interval])
            }
            interval *= 2
        }
        return newList.first!
    }
    
    private func merge2List(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var l1 = list1
        var l2 = list2
        let prev: ListNode? = ListNode(0)
        var p = prev
        while l1 != nil && l2 != nil {
            if l1!.val <= l2!.val {
                p?.next = l1
                l1 = l1?.next
            } else {
                p?.next = l2
                l2 = l2?.next
            }
            p = p?.next
        }
        p?.next = l1 ?? l2
        return prev?.next
    }
}

/*
 1->4->5,
 1->3->4,
 2->6
 */

func test023(s: Solution) {
    let node1 = ListNode(1)
    let node2 = ListNode(4)
    let node3 = ListNode(5)
    
    let node4 = ListNode(1)
    let node5 = ListNode(3)
    let node6 = ListNode(4)
    
    let node7 = ListNode(2)
    let node8 = ListNode(6)
    
    node1.next = node2
    node2.next = node3
    
    node4.next = node5
    node5.next = node6
    
    node7.next = node8
    
    let lists = [node1, node4, node7]
    
    ListNode.printNode(node: s.mergeKLists(lists))
}
