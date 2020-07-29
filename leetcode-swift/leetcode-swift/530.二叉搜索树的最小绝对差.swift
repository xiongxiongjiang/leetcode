//
//  530.二叉搜索树的最小绝对差.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/28.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给你一棵所有节点为非负值的二叉搜索树，请你计算树中任意两节点的差的绝对值的最小值。

 示例：

 输入：

    1
     \
      3
     /
    2

 输出：
 1

 解释：
 最小绝对差为 1，其中 2 和 1 的差的绝对值为 1（或者 2 和 3）。
  
 提示：
 树中至少有 2 个节点。
 本题与 783 https://leetcode-cn.com/problems/minimum-distance-between-bst-nodes/ 相同
 */

extension Solution {
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        var nums = [Int]()
        //通过中序遍历二叉搜索树得到的关键码序列是一个递增序列。
        inorder(root, &nums)
        nums.sort()
        var res = Int.max
        for i in 0..<nums.count-1 {
            res = min(res, abs(nums[i] - nums[i+1]))
        }
        return res
    }
    
    func inorder(_ root: TreeNode?, _ nums: inout [Int]) {
        guard let root = root else { return }
        inorder(root.left, &nums)
        nums.append(root.val)
        inorder(root.right, &nums)
    }
}
