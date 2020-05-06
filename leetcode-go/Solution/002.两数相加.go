package Solution

/*
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

 示例：
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
*/

func addTwoNumbers(l1 *ListNode, l2 *ListNode) *ListNode {
	carry := 0
	prev := &ListNode{-1, nil}
	p := prev
	for l1 != nil || l2 != nil {
		x := 0
		y := 0
		if l1 != nil {
			x = l1.Val
		}
		if l2 != nil {
			y = l2.Val
		}
		sum := x + y + carry
		carry = sum / 10
		curr := sum % 10
		p.Next = &ListNode{curr, nil}
		p = p.Next
		if l1 != nil {
			l1 = l1.Next
		}
		if l2 != nil {
			l2 = l2.Next
		}
	}
	if carry != 0 {
		p.Next = &ListNode{carry, nil}
	}
	return prev.Next
}

func Test002() {
	node1 := CreatListNode([]int{8, 4, 3})
	node2 := CreatListNode([]int{5, 6, 4})
	newNode := addTwoNumbers(node1, node2)
	PrintListNode(newNode)
}