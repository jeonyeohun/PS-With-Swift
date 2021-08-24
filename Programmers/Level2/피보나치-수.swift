func solution(_ n:Int) -> Int {
    var dp  = Array(repeating: 0, count: n + 1)
    dp[1] = 1
    dp[2] = 1
     
    for i in 3...n {
        dp[i] = dp[i - 1] % 1234567 + dp[i - 2] % 1234567
    }
    
    return dp[n] % 1234567
}