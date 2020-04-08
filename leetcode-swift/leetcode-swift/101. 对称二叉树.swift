//
//  101. 对称二叉树.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/1.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二叉树，检查它是否是镜像对称的。

 例如，二叉树 [1,2,2,3,4,4,3] 是对称的。

     1
    / \
   2   2
  / \ / \
 3  4 4  3
 但是下面这个 [1,2,2,null,3,null,3] 则不是镜像对称的:

     1
    / \
   2   2
    \   \
    3    3
 说明:

 如果你可以运用递归和迭代两种方法解决这个问题，会很加分。
 */

extension Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        return isMirror(root, root)
    }
    
    func isMirror(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        if left == nil || right == nil {
            return false
        }
        return (left?.val == right?.val) && isMirror(left?.left, right?.right) && isMirror(left?.right, right?.left)
    }
}

func test101(s: Solution) {
    let root = TreeNode(1)
    let node1 = TreeNode(2)
    let node2 = TreeNode(2)
    let node3 = TreeNode(3)
    let node4 = TreeNode(4)
    let node5 = TreeNode(4)
    let node6 = TreeNode(3)
    
    root.left = node1
    root.right = node2
    
    node1.left = node3
    node1.right = node4
    
    node2.left = node5
    node2.right = node6

    print(s.isSymmetric(root))
}
