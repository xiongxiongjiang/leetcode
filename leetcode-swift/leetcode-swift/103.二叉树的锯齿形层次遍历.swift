//
//  103.二叉树的锯齿形层次遍历.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/10.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

extension Solution {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var stack = [TreeNode?]()
        var res = [[Int]]()
        stack.append(root)
        //0:从左到右 1:从右到左
        var flag = 0
        while stack.isEmpty == false {
            let size = stack.count
            var level = [Int]()
            for _ in 0..<size {
                let node = stack.removeFirst()
                if flag == 0 {
                    level.append(node!.val)
                } else {
                    level = [node!.val] + level
                }
                if let left = node?.left {
                    stack.append(left)
                }
                if let right = node?.right {
                    stack.append(right)
                }
            }
            flag = flag == 0 ? 1 : 0
            res.append(level)
        }
        return res
    }
}

/*
   3
  / \
 9  20
   /  \
  15   7
 */

func test103(s: Solution) {
    let nodeA = TreeNode(3)
    let nodeB = TreeNode(9)
    let nodeC = TreeNode(20)
    let nodeD = TreeNode(15)
    let nodeE = TreeNode(7)
    
    let node1 = TreeNode(11)
    let node2 = TreeNode(12)
    nodeB.left = node1
    nodeB.right = node2

    nodeA.left = nodeB
    nodeA.right = nodeC

    nodeC.left = nodeD
    nodeC.right = nodeE
    
    print(s.zigzagLevelOrder(nodeA))
}
