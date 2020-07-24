//
//  117.填充每个节点的下一个右侧节点指针II.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/7/22.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

/*

 给定一个二叉树

 struct Node {
   int val;
   Node *left;
   Node *right;
   Node *next;
 }
 填充它的每个 next 指针，让这个指针指向其下一个右侧节点。如果找不到下一个右侧节点，则将 next 指针设置为 NULL。

 初始状态下，所有 next 指针都被设置为 NULL。

 进阶：
 你只能使用常量级额外空间。
 使用递归解题也符合要求，本题中递归程序占用的栈空间不算做额外的空间复杂度。
 */

extension Solution {
    func connect2(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var stack = [Node]()
        stack.append(root)
        while stack.isEmpty == false {
            let size = stack.count
            var level = [Node]()
            for _ in 0..<size {
                let node = stack.removeFirst()
                level.append(node)
                if let left = node.left {
                    stack.append(left)
                }
                if let right = node.right {
                    stack.append(right)
                }
            }
            for i in 0..<level.count - 1 {
                level[i].next = level[i+1]
            }
        }
        return root
    }
}
