//
//  225. 用队列实现栈.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation
/*
 使用队列实现栈的下列操作：

 push(x) -- 元素 x 入栈
 pop() -- 移除栈顶元素
 top() -- 获取栈顶元素
 empty() -- 返回栈是否为空

 注意:

 你只能使用队列的基本操作-- 也就是 push to back, peek/pop from front, size, 和 is empty 这些操作是合法的。
 你所使用的语言也许不支持队列。 你可以使用 list 或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。
 你可以假设所有操作都是有效的（例如, 对一个空的栈不会调用 pop 或者 top 操作）。

 */

class MyStack {

    private var stack = [Int]()

    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Push element x onto stack. */
    func push(_ x: Int) {
        stack.append(x)
    }
    
    /** Removes the element on top of the stack and returns that element. */
    func pop() -> Int {
        let top = self.top()
        stack.removeLast()
        return top
    }
    
    /** Get the top element. */
    func top() -> Int {
        return stack.last ?? 0
    }
    
    /** Returns whether the stack is empty. */
    func empty() -> Bool {
        return stack.last == nil
    }
}

func test225(s: Solution) {
    let obj = MyStack()
    obj.push(5)
    let ret_2: Int = obj.pop()
    let ret_3: Int = obj.top()
    let ret_4: Bool = obj.empty()
    print(ret_2, ret_3, ret_4)
}
