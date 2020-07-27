//
//  剑指Offer28.对称的二叉树.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/27.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 请实现一个函数，用来判断一棵二叉树是不是对称的。如果一棵二叉树和它的镜像一样，那么它是对称的。

 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
   2   2
  / \ / \
 3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

     1
    / \
   2   2
    \   \
    3    3
 
 示例 1：
 输入：root = [1,2,2,3,4,4,3]
 输出：true
 
 示例 2：
 输入：root = [1,2,2,null,3,null,3]
 输出：false
  
 限制：
 0 <= 节点个数 <= 1000
 注意：本题与主站 101 题相同：https://leetcode-cn.com/problems/symmetric-tree/
 */

extension Solution {
    func isSymmetric1(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return isMirror1(left: root, right: root)
    }
    
    func isMirror1(left: TreeNode?, right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil {
            return false
        }
        return left?.val == right?.val && isMirror1(left: left?.left, right: right?.right) && isMirror1(left: left?.right, right: right?.left)
    }
}
