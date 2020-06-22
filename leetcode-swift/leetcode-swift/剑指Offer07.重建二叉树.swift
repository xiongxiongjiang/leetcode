//
//  剑指Offer07.重建二叉树.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/29.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 输入某二叉树的前序遍历和中序遍历的结果，请重建该二叉树。假设输入的前序遍历和中序遍历的结果中都不含重复的数字。
 例如，给出
 前序遍历 preorder = [3,9,20,15,7]
 中序遍历 inorder = [9,3,15,20,7]
 返回如下的二叉树：

     3
    / \
   9  20
     /  \
    15   7

 限制：
 0 <= 节点个数 <= 5000
 */

extension Solution {
    func buildTree1(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 {
            return nil
        }
        if preorder.count == 1 {
            return TreeNode(preorder.first!)
        }
        let root = TreeNode(preorder.first!)
        var rootIndex = 0
        for i in 0..<inorder.count {
            if inorder[i] == root.val {
                rootIndex = i
            }
        }
        if rootIndex > 0 {
            let inorderLeft = Array(inorder[0..<rootIndex])
            let preorderLeft = Array(preorder[1...rootIndex])
            root.left = buildTree(preorderLeft, inorderLeft)
        }
        if rootIndex < inorder.count - 1 {
            let inorderRight = Array(inorder[rootIndex+1..<inorder.count])
            let preorderRight = Array(preorder[rootIndex+1..<preorder.count])
            root.right = buildTree(preorderRight, inorderRight)
        }
        return root
    }
}

func testOffer007(s: Solution) {
    let preorder = [3,9,20,15,7]
    let inorder = [9,3,15,20,7]
    let root = s.buildTree1(preorder, inorder)
    print(s.preorderTraversal(root))
    print(s.inorderTraversal1(root))
}
