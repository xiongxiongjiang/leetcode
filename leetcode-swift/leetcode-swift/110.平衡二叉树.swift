//
//  110. 平衡二叉树.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/3.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 给定一个二叉树，判断它是否是高度平衡的二叉树。

 本题中，一棵高度平衡二叉树定义为：

 一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过1。

 示例 1:

 给定二叉树 [3,9,20,null,null,15,7]

     3
    / \
   9  20
     /  \
    15   7
 返回 true 。

 示例 2:

 给定二叉树 [1,2,2,3,3,null,null,4,4]

        1
       / \
      2   2
     / \
    3   3
   / \
  4   4
 返回 false 。
 */

extension Solution {
    func isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return abs(maxDepth(root.left) - maxDepth(root.right)) < 2 && isBalanced(root.left) && isBalanced(root.right)
    }
}

func test110(s: Solution) {
    let root = TreeNode(1)
    let node1 = TreeNode(2)
    let node2 = TreeNode(2)
    let node3 = TreeNode(3)
    let node4 = TreeNode(3)
    let node5 = TreeNode(4)
    let node6 = TreeNode(4)
    
    root.left = node1
    root.right = node2
    
    node1.left = node3
    node1.right = node4
    
    node3.left = node5
    node3.right = node6
    
    print(s.isBalanced(root))
}


