//
//  面试题55-I.二叉树的深度.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/6/2.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 输入一棵二叉树的根节点，求该树的深度。从根节点到叶节点依次经过的节点（含根、叶节点）形成树的一条路径，最长路径的长度为树的深度。

 例如：

 给定二叉树 [3,9,20,null,null,15,7]，

     3
    / \
   9  20
     /  \
    15   7
 返回它的最大深度 3 。

 提示：
 节点总数 <= 10000
 注意：本题与主站 104 题相同：https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/
 */

extension Solution {
    func maxDepth1(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return  0
        }
        return 1 + max(maxDepth1(root.left), maxDepth1(root.right))
    }
}
