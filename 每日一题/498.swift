// https://leetcode.cn/problems/diagonal-traverse/
class Solution {
    func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
        var ans: [Int] = []
        let (m, n) = (mat.count, mat[0].count)
        let maxv = m + n - 1
        for i in 0..<maxv {
            if i & 1 == 0 {
                let lowBound = max(0, i - m + 1)
                let upBound = min(n - 1, i)
                for j in lowBound...upBound {
                    ans.append(mat[i - j][j])
                }
            } else {
                let lowBound = max(0, i - n + 1)
                let upBound = min(m - 1, i)
                for j in lowBound...upBound {
                    ans.append(mat[j][i - j])
                }
            }
        }
        return ans
    }
}
