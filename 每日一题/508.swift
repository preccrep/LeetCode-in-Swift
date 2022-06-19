// https://leetcode.cn/problems/most-frequent-subtree-sum/
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    
    func findFrequentTreeSum(_ root: TreeNode?) -> [Int] {
        var cnt = Dictionary<Int, Int>()
        func DFS(_ head: TreeNode?) -> Int {
            guard let r = head else {
                return 0
            }
            var sum = r.val + DFS(r.left) + DFS(r.right)
            if let s = cnt[sum] {
                cnt[sum] = s + 1
            } else {
                cnt[sum] = 1
            }
            return sum
        }
        DFS(root)
        let sortedCnt = cnt.sorted(by: {$0.1>$1.1})
        var maxv = 0
        for (k, v) in sortedCnt {
            maxv = v
            break
        }
        var ans = [Int]()
        for (k, v) in sortedCnt {
            if v < maxv {
                break
            }
            ans.append(k)
        }
        return ans
    }
}
