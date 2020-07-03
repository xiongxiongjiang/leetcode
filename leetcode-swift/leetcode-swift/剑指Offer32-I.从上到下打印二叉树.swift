//
//  剑指Offer32-I.从上到下打印二叉树.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/3.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 从上到下打印出二叉树的每个节点，同一层的节点按照从左到右的顺序打印。

 例如:
 给定二叉树: [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 返回：

 [3,9,20,15,7]
 
 提示：
 节点总数 <= 1000
 */

extension Solution {
    func levelOrder1(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var res = [Int]()
        var stack = [TreeNode]()
        stack.append(root)
        while stack.isEmpty == false {
            let count = stack.count
            for _ in 0..<count {
                let node = stack.removeFirst()
                res.append(node.val)
                if let left = node.left {
                    stack.append(left)
                }
                if let right = node.right {
                    stack.append(right)
                }
            }
        }
        return res
    }
}

func testOffer32I(s: Solution) {
    let nodeA = TreeNode(3)
    let nodeB = TreeNode(9)
    let nodeC = TreeNode(20)
    let nodeD = TreeNode(15)
    let nodeE = TreeNode(7)

    nodeA.left = nodeB
    nodeA.right = nodeC

    nodeC.left = nodeD
    nodeC.right = nodeE
    
    let node1 = TreeNode(10)
    nodeB.left = node1
    let node2 = TreeNode(12)
    nodeD.left = node2
    
    print(s.levelOrder1(nodeA))
}
