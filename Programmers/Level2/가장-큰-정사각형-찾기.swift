import Foundation

func solution(_ board:[[Int]]) -> Int {
    var answer:Int = 0
    var dp = board
    
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            answer = max(answer, board[i][j])
            if i - 1 < 0 || j - 1 < 0 { 
                continue 
            }
            if board[i][j] == 1 && board[i-1][j] == 1 && board[i][j-1] == 1 {
                dp[i][j] = min(dp[i][j-1], dp[i-1][j], dp[i-1][j-1]) + 1
                answer = max(answer, dp[i][j])
            }
        }
    }
    
    return answer * answer
}