package Solution

import (
	"fmt"
	"strings"
)

/*
 编写一个函数来查找字符串数组中的最长公共前缀。

 如果不存在公共前缀，返回空字符串 ""。

 示例 1:

 输入: ["flower","flow","flight"]
 输出: "fl"
 示例 2:

 输入: ["dog","racecar","car"]
 输出: ""
 解释: 输入不存在公共前缀。
 说明:

 所有输入只包含小写字母 a-z 。
*/

func longestCommonPrefix(strs []string) string {
	if len(strs) == 0 {
		return ""
	}
	first := strs[0]
	for i := 0; i < len(strs); i ++ {
		str := strs[i]
		for strings.HasPrefix(str, first) == false {
				first = first[0: len(first) - 1]
			if first == "" {
				return ""
			}
		}
	}
	return first
}

func Test014()  {
	//fmt.Print(longestCommonPrefix([]string{"flower","flow","flight"}))
	fmt.Print(longestCommonPrefix([]string{"c","acc","ccc"}))
}