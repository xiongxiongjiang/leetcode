//
//  144. 二叉树的前序遍历.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二叉树，返回它的 前序 遍历。

 示例:
 
 输入: [1,null,2,3]
    1
     \
      2
     /
    3

 输出: [1,2,3]
 */

fileprivate var arr = [Int]()

extension Solution {
    //前序遍历，中左右
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return arr }
        arr.append(root.val)
        _ = preorderTraversal(root.left)
        _ = preorderTraversal(root.right)
        return arr
    }
    
    func preorderTraversal1(_ root: TreeNode?) -> [Int] {
        var res = [Int]()
        var stack = [TreeNode?]()
        stack.append(root)
        while !stack.isEmpty {
            //根据栈后进先出的原则 先放右子树再放左子树。当栈为空时，说明所有的子树都被遍历，函数结束
            let current = stack.removeLast()
            res.append(current!.val)
            if let right = current?.right {
                stack.append(right)
            }
            if let left = current?.left {
                stack.append(left)
            }
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
         /
        12
       /  \
      11  13
*/
func test144(s: Solution) {
    let nodeA = TreeNode(3)
    let nodeB = TreeNode(9)
    let nodeC = TreeNode(20)
    let nodeD = TreeNode(15)
    let nodeE = TreeNode(7)
    
    let node1 = TreeNode(11)
    let node2 = TreeNode(12)
    let node3 = TreeNode(13)
    
    nodeD.right = node2
    
    node2.left = node1
    node2.right = node3

    nodeA.left = nodeB
    nodeA.right = nodeC

    nodeC.left = nodeD
    nodeC.right = nodeE
    
    print(s.preorderTraversal(nodeA))
    print(s.preorderTraversal1(nodeA))
}
