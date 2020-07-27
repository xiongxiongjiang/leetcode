//
//  剑指Offer27.二叉树的镜像.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/27.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 请完成一个函数，输入一个二叉树，该函数输出它的镜像。

 例如输入：

      4
    /   \
   2     7
  / \   / \
 1   3 6   9
 
 镜像输出：
      4
    /   \
   7     2
  / \   / \
 9   6 3   1

 示例 1：
 输入：root = [4,2,7,1,3,6,9]
 输出：[4,7,2,9,6,3,1]
  
 限制：
 0 <= 节点个数 <= 1000
 注意：本题与主站 226 题相同：https://leetcode-cn.com/problems/invert-binary-tree/
 */

extension Solution {
    func mirrorTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let tmp = root.left
        root.left = mirrorTree(root.right)
        root.right = mirrorTree(tmp)
        return root
    }
}

func testOffer27(s: Solution) {
    
}
