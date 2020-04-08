//
//  196. 删除重复的电子邮箱.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation
/*
 编写一个 SQL 查询，来删除 Person 表中所有重复的电子邮箱，重复的邮箱里只保留 Id 最小 的那个。

 +----+------------------+
 | Id | Email            |
 +----+------------------+
 | 1  | john@example.com |
 | 2  | bob@example.com  |
 | 3  | john@example.com |
 +----+------------------+
 Id 是这个表的主键。
 例如，在运行你的查询语句之后，上面的 Person 表应返回以下几行:

 +----+------------------+
 | Id | Email            |
 +----+------------------+
 | 1  | john@example.com |
 | 2  | bob@example.com  |
 +----+------------------+
  

 提示：

 执行 SQL 之后，输出是整个 Person 表。
 使用 delete 语句。
 */

//delete from Person where id not in (select Id from (select min(Id) as Id from Person group by Email) as p);
