//
//  ListNode.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

extension ListNode {
    static func printNode(node: ListNode?) {
        var tempNode = node
        while let node = tempNode {
            print(node.val)
            tempNode = tempNode?.next
        }
    }
}

