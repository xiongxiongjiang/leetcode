//
//  098.验证二叉搜索树.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/9.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二叉树，判断其是否是一个有效的二叉搜索树。
 
 假设一个二叉搜索树具有如下特征：
 节点的左子树只包含小于当前节点的数。
 节点的右子树只包含大于当前节点的数。
 所有左子树和右子树自身必须也是二叉搜索树。
 
 示例 1:
 输入:
     2
    / \
   1   3
 输出: true
 
 示例 2:
 输入:
     5
    / \
   1   4
      / \
     3   6
 输出: false
 解释: 输入为: [5,1,4,null,null,3,6]。
      根节点的值为 5 ，但是其右子节点值为 4 。
 */

extension Solution {
    func isValidBST(_ root: TreeNode?) -> Bool {
        var stack = Array<TreeNode?>()
        var curr = root
        var min = Int.min
        while stack.isEmpty == false || curr != nil {
            while curr != nil {
                stack.append(curr)
                curr = curr?.left
            }
            //用数组实现栈，移除最后一个(removeLast)等于pop()，往数组最后一个添加(append)等于push()
            curr = stack.removeLast()
            if curr!.val <= min {
                return false
            }
            min = curr!.val
            curr = curr?.right
        }
        return true
    }
    
}

func test098(s: Solution) {
    let root = TreeNode(5)
    let node1 = TreeNode(1)
    let node2 = TreeNode(4)
    let node3 = TreeNode(3)
    let node4 = TreeNode(6)
    root.left = node1
    root.right = node2
    node2.left = node3
    node2.right = node4
    print(s.isValidBST(root))
}
