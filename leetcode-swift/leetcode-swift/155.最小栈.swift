//
//  155.最小栈.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/4/21.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation

class MinStack {
    
    var min = Int.max
    
    var stack = [Int]()

    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if x < min {
            min = x
        }
    }
    
    func pop() {
        let last = stack.removeLast()
        if last == min {
            min = stack.min() ?? Int.max
        }
    }
    
    func top() -> Int {
        if stack.count > 0 {
            return stack.last ?? 0
        }
        return 0
    }
    
    func getMin() -> Int {
        return min
    }
}

func test155() {
    let obj = MinStack()
    obj.push(-2)
    obj.push(0)
    obj.push(-3)
    print(obj.getMin())
    obj.pop()
    print(obj.top())
    print(obj.getMin())
}
