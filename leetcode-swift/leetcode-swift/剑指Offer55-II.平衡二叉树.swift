//
//  剑指Offer55-II.平衡二叉树.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/20.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 输入一棵二叉树的根节点，判断该树是不是平衡二叉树。如果某二叉树中任意节点的左右子树的深度相差不超过1，那么它就是一棵平衡二叉树。

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

 限制：
 1 <= 树的结点个数 <= 10000
 注意：本题与主站 110 题相同：https://leetcode-cn.com/problems/balanced-binary-tree/
 */

extension Solution {
    func isBalanced1(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        guard abs(maxDepth2(root.left) - maxDepth2(root.right)) < 2 else {
            return false
        }
        return isBalanced1(root.left) && isBalanced1(root.right)
    }
    
    func maxDepth2(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxDepth2(root.left), maxDepth2(root.right)) + 1
    }
}
