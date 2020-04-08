//
//  100. 相同的树.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/2.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定两个二叉树，编写一个函数来检验它们是否相同。
 如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。

 示例 1:
 输入:       1         1
           / \       / \
          2   3     2   3

         [1,2,3],   [1,2,3]
 输出: true
 
 示例 2:
 输入:      1          1
           /           \
          2             2

         [1,2],     [1,null,2]
 输出: false
 
 示例 3:
 输入:       1         1
           / \       / \
          2   1     1   2

         [1,2,1],   [1,1,2]
 输出: false
 */

extension Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil {
            return true
        }
        if q?.val != p?.val {
            return false
        }
        return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}

func test100(s: Solution) {
    let node1 = TreeNode(1)
    let node2 = TreeNode(2)
    let node3 = TreeNode(1)
    let node4 = TreeNode(1)
    let node5 = TreeNode(1)
    let node6 = TreeNode(2)
    node1.left = node2
    node1.right = node3
    node4.left = node5
    node4.right = node6
    print(s.isSameTree(node1, node4))
}
