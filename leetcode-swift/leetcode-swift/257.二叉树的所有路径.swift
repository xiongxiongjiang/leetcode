//
//  257.二叉树的所有路径.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/8/6.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

extension Solution {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        if root == nil {
            return []
        }
        var res = [String]()
        dfs257(root, stack: "", res: &res)
        return res
    }
    
    func dfs257(_ root: TreeNode?, stack: String, res: inout [String]) {
        guard let root = root else { return }
        var stack = stack
        stack += "\(root.val)"
        if root.left == nil && root.right == nil {
            res.append(stack)
        } else {
            stack += "->"
            dfs257(root.left, stack: stack, res: &res)
            dfs257(root.right, stack: stack, res: &res)
        }
    }
}

func test257(s: Solution) {
    let codec = Codec()
    let root = codec.deserialize("1,2,3,4,5,6,7")
    print(s.binaryTreePaths(root))
}
