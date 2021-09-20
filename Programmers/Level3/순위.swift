import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    var board = Array(repeating: Array(repeating: -1, count: n+1), count: n+1)
    for result in results {
        board[result[0]][result[1]] = 1
        board[result[1]][result[0]] = 0
    }
    for mid in 0...n {
        for start in 0...n {
            for end in 1...n {
                if start == end {
                    board[start][end] = 0
                }
                if board[start][mid] == 1 && board[mid][end] == 1 {
                    board[start][end] = 1
                }
                if board[start][mid] == 0 && board[mid][end] == 0 {
                    board[start][end] = 0
                }
            }
        }
    }
    return board.map({ record in record.filter({ $0 == -1 }).count })
        .filter({ $0 == 1 })
        .count
}