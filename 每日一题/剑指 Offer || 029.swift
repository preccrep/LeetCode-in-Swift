// https://leetcode.cn/problems/4ueAj6/
/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func insert(_ head: Node?, _ insertVal: Int) -> Node? {
        var newNode = Node(insertVal)
        if head == nil {
            newNode.next = newNode
            return newNode
        }
        var p = head!
        while p.next! != head! {
            if p.val > p.next!.val {
                break
            }
            p = p.next!
        }
        if p.val <= insertVal || p.next!.val >= insertVal {
            newNode.next = p.next!
            p.next = newNode
        } else {
            while p.next!.val < insertVal {
                p = p.next!
            }
            newNode.next = p.next!
            p.next = newNode
        }
        return head
    }
}
