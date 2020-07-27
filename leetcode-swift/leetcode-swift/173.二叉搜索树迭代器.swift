//
//  173.二叉搜索树迭代器.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/25.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*
 实现一个二叉搜索树迭代器。你将使用二叉搜索树的根节点初始化迭代器。

 调用 next() 将返回二叉搜索树中的下一个最小的数。
 
 */

class BSTIterator {

    var stack: [TreeNode?]
    
    init(_ root: TreeNode?) {
        stack = [TreeNode?]()
        leftMostInorder(root)
    }
    
    func leftMostInorder(_ root: TreeNode?) {
        var root = root
        while root != nil {
            stack.append(root)
            root = root?.left
        }
    }
    
    /** @return the next smallest number */
    func next() -> Int {
        guard hasNext() else {
            return -1
        }
        let topMostNode = stack.removeLast()
        if topMostNode?.right != nil {
            leftMostInorder(topMostNode?.right)
        }
        return topMostNode?.val ?? 0
    }
    
    /** @return whether we have a next smallest number */
    func hasNext() -> Bool {
        return !stack.isEmpty
    }
}
