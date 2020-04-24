//
//  111.二叉树的最小深度.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/24.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二叉树，找出其最小深度。
 最小深度是从根节点到最近叶子节点的最短路径上的节点数量。
 说明: 叶子节点是指没有子节点的节点。
 
 示例:
 给定二叉树 [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回它的最小深度  2.
 */

extension Solution {
    func minDepth(_ root: TreeNode?) -> Int {
        //层次遍历
//        var stack = [TreeNode]()
//        guard let root = root else { return 0 }
//        stack.append(root)
//        var res = 0
//        while stack.isEmpty == false {
//            res += 1
//            for _ in 0..<stack.count {
//                let node = stack.removeFirst()
//                if node.left == nil && node.right == nil {
//                    return res
//                }
//                if let left = node.left {
//                    stack.append(left)
//                }
//                if let right = node.right {
//                    stack.append(right)
//                }
//            }
//        }
//        return res
        
        //递归
        guard let root = root else {
            return 0
        }

        if root.left == nil, root.right == nil {
            return 1
        }

        var minCount = Int.max

        if let left = root.left {
            minCount = min(minDepth(left), minCount)
        }

        if let right = root.right {
            minCount = min(minDepth(right), minCount)
        }

        return minCount + 1
    }
}

func test111(s: Solution) {
    let nodeA = TreeNode(3)
    let nodeB = TreeNode(9)
    let nodeC = TreeNode(20)
    let nodeD = TreeNode(15)
    let nodeE = TreeNode(7)

    nodeA.left = nodeB
    nodeA.right = nodeC

    nodeC.left = nodeD
    nodeC.right = nodeE

    print(s.minDepth(nodeA))
}
