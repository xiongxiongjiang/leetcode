//
//  145.二叉树的后序遍历.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/24.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二叉树，返回它的 后序 遍历。

 示例:

 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [3,2,1]
 进阶: 递归算法很简单，你可以通过迭代算法完成吗？
 */

fileprivate var arr = [Int]()

extension Solution {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return arr }
        _ = postorderTraversal(root.left)
        _ = postorderTraversal(root.right)
        arr.append(root.val)
        return arr
    }
    
    func postorderTraversal1(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        var res = [Int]()
        var stack = [root]
        while !stack.isEmpty {
            let node = stack.removeLast()
            res.append(node.val)
            if let left = node.left {
                stack.append(left)
            }
            if let right = node.right {
                stack.append(right)
            }
        }
        return res.reversed()
    }
}

/*
  3
 / \
9  20
  /  \
 15   7
*/

func test145(s: Solution) {
    let nodeA = TreeNode(3)
    let nodeB = TreeNode(9)
    let nodeC = TreeNode(20)
    let nodeD = TreeNode(15)
    let nodeE = TreeNode(7)
    
    nodeA.left = nodeB
    nodeA.right = nodeC

    nodeC.left = nodeD
    nodeC.right = nodeE
    
    //[9, 15, 7, 20, 3]
    print(s.postorderTraversal1(nil))
}


