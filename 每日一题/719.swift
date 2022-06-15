// https://leetcode.cn/problems/find-k-th-smallest-pair-distance/
class Solution {
    func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        let sortedNums = nums.sorted()
        var left = 0, right = sortedNums[n - 1] - sortedNums[0]
        while left <= right {
            let mid = (left + right) >> 1
            var cnt = 0, i = 0
            for j in 0..<n {
                while sortedNums[j] - sortedNums[i] > mid {
                    i += 1
                }
                cnt += j - i
            }
            if cnt >= k {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return left
    }
}
