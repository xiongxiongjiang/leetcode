package Solution

/*
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。

 示例 1：
 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。

 示例 2：
 输入: "cbbd"
 输出: "bb"
*/

func longestPalindrome(s string) string {
	count := len(s)
	if count < 2 {
		return s
	}
	dp := make([][]bool, count)
	for i := 0; i < count; i++ {
		dp[i] = make([]bool, count)
	}
	for i := 0; i < count; i++ {
		dp[i][i] = true
	}
	maxLen := 1
	start := 0
	for j := 1; j < count; j++ {
		for i := 0; i < j; i++ {
			if s[i] == s[j] {
				if j-i < 3 {
					dp[i][j] = true
				} else {
					dp[i][j] = dp[i+1][j-1]
				}
			} else {
				dp[i][j] = false
			}
			if dp[i][j] == true {
				currLen := j - i + 1
				if currLen > maxLen {
					maxLen = currLen
					start = i
				}
			}
		}
	}
	return s[start : start+maxLen]
}

func Test004() {
	print(longestPalindrome("babad"))
}
