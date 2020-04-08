//
//  182. 查找重复的电子邮箱.swift
//  leetcode-swift
//
//  Created by 徐荣 on 2020/3/31.
//  Copyright © 2020 xurong. All rights reserved.
//

import Foundation
/*
 编写一个 SQL 查询，查找 Person 表中所有重复的电子邮箱。

 示例：

 +----+---------+
 | Id | Email   |
 +----+---------+
 | 1  | a@b.com |
 | 2  | c@d.com |
 | 3  | a@b.com |
 +----+---------+
 根据以上输入，你的查询应返回以下结果：

 +---------+
 | Email   |
 +---------+
 | a@b.com |
 +---------+
 说明：所有电子邮箱都是小写字母。
 */


//select pe.Email from Person as pe where id not in (select Id from (select min(Id) as Id from Person group by Email) as p) group by pe.Email;
