//
//  232.用栈实现队列.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/12.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

class MyQueue {
    
    private var stack = [Int]()

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        stack.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        return stack.removeFirst()
    }
    
    /** Get the front element. */
    func peek() -> Int {
        return stack.first ?? 0
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return stack.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */

func test232(s: Solution) {
    let obj = MyQueue()
    obj.push(5)
    let ret_2: Int = obj.pop()
    print(ret_2)
    let ret_3: Int = obj.peek()
    print(ret_3)
    let ret_4: Bool = obj.empty()
    print(ret_4)
    
}
