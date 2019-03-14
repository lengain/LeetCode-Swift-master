//
//  AddTwoNumbersViewController.swift
//  LeetCode-Swift-master
//
//  Created by lengain on 2019/1/14.
//  Copyright © 2019 Lengain. All rights reserved.
//

import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public func traverseNode() {
        print(self.val)
        if self.next != nil {
            self.next?.traverseNode()
        }
    }
}

class AddTwoNumbersViewController: LNBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let node1 = ListNode.init(2)
        let node2 = ListNode.init(4)
        node1.next = node2
        let node3 = ListNode.init(3)
        node2.next = node3
        
        let node4 = ListNode.init(5)
        let node5 = ListNode.init(6)
        node4.next = node5
        let node6 = ListNode.init(4)
        node5.next = node6
        
        let result1 = Solution.addTwoNumbers(node1, node4)
        if result1 != nil {
            result1?.traverseNode()
        }
        let node7 = ListNode.init(5)
        let node8 = ListNode.init(5)

        let result2 = Solution.addTwoNumbers(node7, node8)
        if result2 != nil {
            result2?.traverseNode()
        }
    }
    /*
    给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
    
    如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
    
    您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
    
    示例：
    输入：(2 -> 4 -> 3) +
         (5 -> 6 -> 4)
    输出：7 -> 0 -> 8
    原因：342 + 465 = 807
    */
    class Solution {
        class func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            var leftNode = l1
            var rightNode = l2
            var resultNode : ListNode?
            var tempResultNode : ListNode?
            var moreThanTen = false
            while leftNode != nil || rightNode != nil {
                var sum = 0;
                if leftNode != nil {
                    sum += leftNode!.val
                    leftNode = leftNode?.next
                }
                if rightNode != nil {
                    sum += rightNode!.val
                    rightNode = rightNode?.next
                }
                if moreThanTen {
                    sum += 1
                }
                if sum > 9 {
                    moreThanTen = true
                    sum = sum % 10
                }else {
                    moreThanTen = false
                }
                if tempResultNode == nil {
                    resultNode = ListNode.init(sum)
                    tempResultNode = resultNode
                }else {
                    tempResultNode?.next = ListNode.init(sum);
                    tempResultNode = tempResultNode?.next;
                }
            }
            if moreThanTen {
                tempResultNode?.next = ListNode.init(1)
            }
            return resultNode;
        }
    }
    
    /// 当数很长时,此方法不正确,会超出数据类型长度,会错误
    class Solution1 {
        class func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            var sum = Solution1.convertMath(l1) + Solution1.convertMath(l2)
            let listNode = ListNode.init(Int(Int64(sum)%10))
            var tempNode = listNode;
            while sum > 0 {
                sum /= 10
                if sum < 1 {break}
                let node = ListNode.init(Int(Int64(sum)%10))
                tempNode.next = node
                tempNode = node
            }
            return listNode;
        }
        
        class func convertMath(_ node: ListNode?) -> Double {
            var tempNode :ListNode? = node;
            var index = 0
            var sum : Double = 0
            while tempNode != nil {
                sum += Double(powf(10, Float(index))) * Double(tempNode!.val)
                index += 1
                tempNode = tempNode!.next
            }
            return sum
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
