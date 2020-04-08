//
//  199. 二叉树的右视图.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/1.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一棵二叉树，想象自己站在它的右侧，按照从顶部到底部的顺序，返回从右侧所能看到的节点值。

 示例:

 输入: [1,2,3,null,5,null,4]
 输出: [1, 3, 4]
 解释:

    1            <---
  /   \
 2     3         <---
  \     \
   5     4       <---
 */

extension Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        if root == nil || root?.val == nil {
            return []
        }
        var queue = [TreeNode]()
        queue.append(root!)
        var res = [Int]()
        while queue.isEmpty == false {
            //其实就是二叉树的层次遍历取最后一个数
            let size = queue.count
            var level = [Int]() //存放该层所有数值
            for _ in 0..<size {
                let node = queue.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            res.append(level.last!)
        }
        return res
    }
}


func test199(s: Solution) {
    let root = TreeNode(1)
    let node1 = TreeNode(2)
    let node2 = TreeNode(3)
    let node3 = TreeNode(5)
    let node4 = TreeNode(4)
    root.left = node1
    root.right = node2
    
    node1.right = node3
    
    node2.right = node4
    
    print(s.rightSideView(root))
}
