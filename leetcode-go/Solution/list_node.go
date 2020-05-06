package Solution

import "fmt"

type ListNode struct {
	Val int
	Next *ListNode
}

func CreatListNode(arr []int) *ListNode {
	prev := &ListNode{-1, nil}
	p := prev
	for i := 0; i < len(arr); i++ {
		p.Next = &ListNode{arr[i], nil}
		p = p.Next
	}
	return prev.Next
}

func PrintListNode(head *ListNode)  {
	p := head
	arr := []int{}
	for p != nil {
		arr = append(arr, p.Val)
		p = p.Next
	}
	fmt.Print(arr)
}