import Foundation

func solution(_ land:[[Int]]) -> Int{
    var dp = land
    
    for i in 1..<land.count {
        for j in 0..<land[0].count {
            for k in 0..<land[0].count {
                if j == k { continue }
                dp[i][j] = max(dp[i][j], dp[i-1][k] + land[i][j])
            }
        }
    }
    
    return dp.last!.max()!
}