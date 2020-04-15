//
//  129.求根到叶子节点数字之和.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/15.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二叉树，它的每个结点都存放一个 0-9 的数字，每条从根到叶子节点的路径都代表一个数字。
 例如，从根到叶子节点路径 1->2->3 代表数字 123。
 计算从根到叶子节点生成的所有数字之和。
 说明: 叶子节点是指没有子节点的节点。

 示例 1:
 输入: [1,2,3]
     1
    / \
   2   3
 输出: 25
 解释:
 从根到叶子节点路径 1->2 代表数字 12.
 从根到叶子节点路径 1->3 代表数字 13.
 因此，数字总和 = 12 + 13 = 25.
 
 示例 2:
 输入: [4,9,0,5,1]
     4
    / \
   9   0
  / \
 5   1
 输出: 1026
 解释:
 从根到叶子节点路径 4->9->5 代表数字 495.
 从根到叶子节点路径 4->9->1 代表数字 491.
 从根到叶子节点路径 4->0 代表数字 40.
 因此，数字总和 = 495 + 491 + 40 = 1026.
 */

extension Solution {
    
    func sumNumbers(_ root: TreeNode?) -> Int {
        return dfs(root: root, sum: 0)
    }
    
    private func dfs(root: TreeNode?, sum: Int) -> Int {
        guard let root = root else { return 0 }
        let curr = sum * 10 + root.val
        if root.left != nil && root.right == nil {
            return dfs(root: root.left, sum: curr)
        } else if root.left == nil && root.right != nil {
            return dfs(root: root.right, sum: curr)
        } else if root.left != nil && root.right != nil {
            return dfs(root: root.left, sum: curr) + dfs(root: root.right, sum: curr)
        } else {
            return curr
        }
    }
}

func test129(s: Solution) {
    let node1 = TreeNode(4)
    let node2 = TreeNode(9)
    let node3 = TreeNode(0)
    let node4 = TreeNode(5)
    let node5 = TreeNode(1)
    node1.left = node2
    node1.right = node3
    node2.left = node4
    node2.right = node5
    print(s.sumNumbers(node1))
}
