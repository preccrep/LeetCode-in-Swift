// https://leetcode.cn/problems/k-diff-pairs-in-an-array/
class Solution {
    func lower_bound(_ nums: [Int], _ k: Int, _ i: Int) -> Int {
        var low = 0, high = nums.count - 1
        while low <= high {
            let mid = (low + high) >> 1
            if k == nums[mid] {
                if mid != i {
                    return mid
                }
                low = mid + 1
            } else if k < nums[mid] {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return low
    }
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        let sorted_nums = nums.sorted()
        let n = sorted_nums.count
        var ans = 0
        for i in 0..<n-1 {
            if i > 0 && sorted_nums[i] == sorted_nums[i - 1] {
                continue
            }
            let target = sorted_nums[i] + k
            let index = lower_bound(sorted_nums, target, i)
            if index < n && sorted_nums[index] == target {
                ans += 1
            }
        }
        return ans
    }
}
