//
//  108.将有序数组转换为二叉搜索树.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/15.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。

 本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。

 示例:

 给定有序数组: [-10,-3,0,5,9],

 一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树：

       0
      / \
    -3   9
    /   /
  -10  5
 */

extension Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return sortedArrayToBSTHelper(nums, 0, nums.count - 1)
    }
    
    func sortedArrayToBSTHelper(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let mid = left + (right - left) / 2
        let root = TreeNode(nums[mid])
        root.left = sortedArrayToBSTHelper(nums, left, mid - 1)
        root.right = sortedArrayToBSTHelper(nums, mid + 1, right)
        return root
    }
}
