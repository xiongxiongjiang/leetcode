//
//  146. LRU缓存机制.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation
/*
 运用你所掌握的数据结构，设计和实现一个  LRU (最近最少使用) 缓存机制。它应该支持以下操作： 获取数据 get 和 写入数据 put 。

 获取数据 get(key) - 如果密钥 (key) 存在于缓存中，则获取密钥的值（总是正数），否则返回 -1。
 写入数据 put(key, value) - 如果密钥不存在，则写入其数据值。当缓存容量达到上限时，它应该在写入新数据之前删除最久未使用的数据值，从而为新的数据值留出空间。

 进阶:

 你是否可以在 O(1) 时间复杂度内完成这两种操作？

 示例:

 LRUCache cache = new LRUCache( 2 /* 缓存容量 */ );

 cache.put(1, 1);
 cache.put(2, 2);
 cache.get(1);       // 返回  1
 cache.put(3, 3);    // 该操作会使得密钥 2 作废
 cache.get(2);       // 返回 -1 (未找到)
 cache.put(4, 4);    // 该操作会使得密钥 1 作废
 cache.get(1);       // 返回 -1 (未找到)
 cache.get(3);       // 返回  3
 cache.get(4);       // 返回  4
 */

/*
 LRU 缓存淘汰算法就是一种常用策略。LRU 的全称是 Least Recently Used，也就是说我们认为最近使用过的数据应该是是「有用的」，很久都没用过的数据应该是无用的，内存满了就优先删那些很久没用过的数据。

 为了让 put 和 get 方法的时间复杂度为O(1)，我们可以总结出 cache 这个数据结构必要的条件：查找快，插入快，删除快，有顺序之分。所以显然 cache 必须有顺序之分，以区分最近使用的和久未使用的数据；而且我们要在 cache 中查找键是否已存在；如果容量满了要删除最后一个数据；每次访问还要把数据插入到队头。

 那么，什么数据结构同时符合上述条件呢？哈希表查找快，但是数据无固定顺序；链表有顺序之分，插入删除快，但是查找慢。所以结合一下，形成一种新的数据结构：哈希链表。

 LRU 缓存算法的核心数据结构就是哈希链表，双向链表和哈希表的结合体。
 */
 
class CacheNode {
    public var key : Int
    public var val : Int
    public var next, prev : CacheNode?
    init(_ k : Int, _ v : Int) {
        self.key = k
        self.val = v
    }
}

class DoubleList {
    //头尾虚节点
    var head, tail : CacheNode?
    //链表元素数
    var size : Int = 0
    
    init() {
        head = CacheNode(0, 0)
        tail = CacheNode(0, 0)
        head?.next = tail
        tail?.prev = head
        size = 0
    }
    
    //在链表头部添加节点x
    public func addFirst(_ x : CacheNode) {
        x.next = head?.next
        x.prev = head
        head?.next?.prev = x
        head?.next = x
        size += 1
    }
    
    //删除链表中的节点（x一定存在）
    public func remove(_ x : CacheNode) {
        x.prev?.next = x.next
        x.next?.prev = x.prev
        size -= 1
    }
    
    //删除链表最后一个节点，并返回该节点
    public func removeLast() -> CacheNode? {
        if tail?.prev?.val == (head?.val)! {
            return nil
        }
        let last = tail?.prev
        remove(last!)
        return last
    }
    
    //返回链表长度
    public func Size() -> Int{
        return size
    }
}

class LRUCache {
    
    //哈希表
    var map: [Int : CacheNode?] = [:]
    //双向链表
    var cache: DoubleList
    //最大容量
    var cap: Int

    init(_ capacity: Int) {
        self.cap = capacity
        self.map = [:]
        self.cache = DoubleList()
    }
    
    func get(_ key: Int) -> Int {
        if map[key] == nil {
            return -1
        }
        let val = (map[key] as? CacheNode)!.val
        //利用put方法把数据提前
        put(key,val)
        return val
    }
    
    func put(_ key: Int, _ value: Int) {
        //先把新节点x做出来
        let x = CacheNode(key, value)
        if map[key] != nil {
            //删除旧节点
            cache.remove((map[key] as? CacheNode)!)
        } else {
            if cap == cache.Size() {
                //删除链表最后一个节点
                let last = cache.removeLast()
                map.removeValue(forKey: (last?.key)!)
            }
        }
        //直接添加到头部
        cache.addFirst(x)
        //更新map数据
        map[key] = x
    }
}

func test146(s: Solution) {
    let cache = LRUCache( 2 /* 缓存容量 */ );
    cache.put(1, 1)
    cache.put(2, 2)
    print(cache.get(1))       // 返回  1
    cache.put(3, 3)           // 该操作会使得密钥 2 作废
    print(cache.get(2))       // 返回 -1 (未找到)
    cache.put(4, 4)           // 该操作会使得密钥 1 作废
    print(cache.get(1))       // 返回 -1 (未找到)
    print(cache.get(3))       // 返回  3
    print(cache.get(4))       // 返回  4
}
