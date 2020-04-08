//
//  112. 路径总和.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/3.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二叉树和一个目标和，判断该树中是否存在根节点到叶子节点的路径，这条路径上所有节点值相加等于目标和。

 说明: 叶子节点是指没有子节点的节点。

 示例:
 给定如下二叉树，以及目标和 sum = 22，

               5
              / \
             4   8
            /   / \
           11  13  4
          /  \      \
         7    2      1
 返回 true, 因为存在目标和为 22 的根节点到叶子节点的路径 5->4->11->2。
 */

extension Solution {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        guard let root = root else { return false }
        if root.val == sum, root.left == nil, root.right == nil {
            return true
        }
        let target = sum - root.val
        return hasPathSum(root.left, target) || hasPathSum(root.right, target)
    }
}


func test112(s: Solution) {
    let root = TreeNode(5)
    let node1 = TreeNode(4)
    let node2 = TreeNode(8)
    let node3 = TreeNode(11)
    let node4 = TreeNode(13)
    let node5 = TreeNode(4)
    let node6 = TreeNode(7)
    let node7 = TreeNode(2)
    let node8 = TreeNode(1)
    
    root.left = node1
    root.right = node2
    
    node1.left = node3
    node2.left = node4
    node2.right = node5
    
    node3.left = node6
    node3.right = node7
    node5.right = node8
    
    print(s.hasPathSum(root, 22))
}
