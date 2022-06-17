// https://leetcode.cn/problems/duplicate-zeros/
class Solution {
    func duplicateZeros(_ arr: inout [Int]) {
        let n = arr.count
        var j = 0
        for i in arr {
            if i == 0 {
                arr.insert(i, at: j)
                arr.remove(at: n)
                j += 1
            }
            j += 1
            if j >= n {
                break
            }
        }
    }
}
