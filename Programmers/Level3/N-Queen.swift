import Foundation

func solution(_ n:Int) -> Int {
    var board = Array(repeating: Array(repeating: false, count: n), count: n)
    var count = 0
    func checkOtherQueen(row: Int, col: Int) -> Bool {
        let rowDir = [1, -1, 1, -1]
        let colDir = [-1, -1, 1, 1]
        for i in 0..<n {
            if row != i && board[i][col] == true {
                return false
            }
        }
        for (rDir, cDir) in zip(rowDir, colDir) {
            var nextRow = row + rDir
            var nextCol = col + cDir
            while nextRow >= 0 && nextRow < n && nextCol >= 0 && nextCol < n {
                if board[nextRow][nextCol] == true {
                    return false
                }
                nextRow += rDir
                nextCol += cDir
            }
        }
        return true
    }

    func dfs(row: Int, currentN: Int) {
        if currentN == n {
            count += 1
            return
        }
        for i in 0..<n {
            board[row][i] = true
            if checkOtherQueen(row: row, col: i) {
                dfs(row: row + 1, currentN: currentN + 1)
            }
            board[row][i] = false
        }
    }
    dfs(row: 0, currentN: 0)
    return count
}