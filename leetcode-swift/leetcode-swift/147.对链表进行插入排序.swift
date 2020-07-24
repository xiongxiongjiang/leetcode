//
//  147.对链表进行插入排序.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/24.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 对链表进行插入排序。

 插入排序的动画演示如上。从第一个元素开始，该链表可以被认为已经部分排序（用黑色表示）。
 每次迭代时，从输入数据中移除一个元素（用红色表示），并原地将其插入到已排好序的链表中。

 插入排序算法：

 插入排序是迭代的，每次只移动一个元素，直到所有元素可以形成一个有序的输出列表。
 每次迭代中，插入排序只从输入数据中移除一个待排序的元素，找到它在序列中适当的位置，并将其插入。
 重复直到所有输入数据插入完为止。
  
 示例 1：
 输入: 4->2->1->3
 输出: 1->2->3->4
 
 示例 2：
 输入: -1->5->3->4->0
 输出: -1->0->3->4->5
 */

extension Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let dummy: ListNode? = ListNode(0)
        var curr = head
        var pre: ListNode?
        while curr != nil {
            //保存curr的后半部分
            let next = curr?.next
            pre = dummy
            //跳过小于curr的节点
            while let preNext = pre?.next, preNext.val < curr!.val {
                pre = pre?.next
            }
            //将curr插入到pre.next前
            curr?.next = pre?.next
            //保存到已排序好的pre后面
            pre?.next = curr
            //指针后移
            curr = next
        }
        return dummy?.next
    }
}

func test147(s: Solution) {
    let new = s.insertionSortList(ListNode.buildNode(arr: [-1,5,3,4,0]))
    ListNode.printNode(node: new)
}
