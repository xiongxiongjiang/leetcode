//
//  109.有序链表转换二叉搜索树.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/16.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个单链表，其中的元素按升序排序，将其转换为高度平衡的二叉搜索树。

 本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。

 示例:

 给定的有序链表： [-10, -3, 0, 5, 9],

 一个可能的答案是：[0, -3, 9, -10, null, 5], 它可以表示下面这个高度平衡二叉搜索树：

       0
      / \
    -3   9
    /   /
  -10  5
 */

extension Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard head != nil else {
            return nil
        }
        var p = head
        var nums = [Int]()
        while p != nil {
            nums.append(p!.val)
            p = p?.next
        }
        return sortedListToBSTHelper(nums, 0, nums.count - 1)
    }
    
    func sortedListToBSTHelper(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let mid = left + (right - left) / 2
        let root = TreeNode(nums[mid])
        root.left = sortedListToBSTHelper(nums, left, mid - 1)
        root.right = sortedListToBSTHelper(nums, mid + 1, right)
        return root
    }
}
