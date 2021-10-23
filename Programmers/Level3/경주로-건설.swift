import Foundation

func solution(_ board:[[Int]]) -> Int {
    enum Dir {
        case start, up, right, left, down;
    }
    var visited = Array(repeating: Array(repeating: false, count: board.count), count: board.count)
    var minCost = 987654321
    func dfs(_ x: Int, _ y: Int, _ totalCost: Int, _ currDir: Dir) {
        visited[x][y] = true 
        let xDir = [0, 0, 1, -1]
        let yDir = [1, -1, 0, 0]
        let dirs:[Dir] = [.down, .up, .right, .left]

        if x == board.count - 1 && y == board.count - 1 {
            minCost = min(minCost, totalCost)
        }
        
        for i in 0..<4 {
            let nextX = x + xDir[i]
            let nextY = y + yDir[i]
            let nextDir = dirs[i]
            let cost = (currDir == .start) || (currDir == nextDir) ? 100 : 600
            if (nextX >= 0 && nextX < board.count)
            && (nextY >= 0 && nextY < board.count)
            && visited[nextX][nextY] == false
            && board[nextX][nextY] != 1 {
             dfs(nextX, nextY, totalCost + cost, nextDir)   
            }
        }
        visited[x][y] = false 
    }
    dfs(0, 0, 0, .start)
    return minCost
}