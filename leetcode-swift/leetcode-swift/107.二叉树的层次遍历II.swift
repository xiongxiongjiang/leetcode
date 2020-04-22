//
//  107.二叉树的层次遍历II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/22.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）

 例如：
 给定二叉树 [3,9,20,null,null,15,7],
     3
    / \
   9  20
     /  \
    15   7
 
 返回其自底向上的层次遍历为：
 [
   [15,7],
   [9,20],
   [3]
 ]
 */

extension Solution {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var res = [[Int]]()
        var stack = [TreeNode]()
        stack.append(root)
        while stack.isEmpty == false {
            var level = [Int]()
            for _ in 0..<stack.count {
                let node = stack.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    stack.append(left)
                }
                if let right = node.right {
                    stack.append(right)
                }
            }
            res = [level] + res
        }
        return res
    }
}

func test107(s: Solution) {
    let nodeA = TreeNode(3)
    let nodeB = TreeNode(9)
    let nodeC = TreeNode(20)
    let nodeD = TreeNode(15)
    let nodeE = TreeNode(7)

    nodeA.left = nodeB
    nodeA.right = nodeC

    nodeC.left = nodeD
    nodeC.right = nodeE
    
    print(s.levelOrderBottom(nodeA))
}
