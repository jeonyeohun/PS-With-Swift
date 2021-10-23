import Foundation

func solution(_ board:[[Int]]) -> Int {
    enum Direction: Int {
        case down, up, right, left;
    }
    let costs = Array(repeating: Array(repeating: 987654321, count: board.count), count: board.count)
    var dirCosts = Array(repeating: costs, count: 4)

    for i in 0..<4 {
        dirCosts[i][0][0] = 0
    }

    func isInRange(x: Int, y: Int) -> Bool {
        return x >= 0 && x < board.count && y >= 0 && y < board.count
    }

    func dfs(_ x: Int, _ y: Int, _ currDir: Direction) {
        let xDir = [0, 0, 1, -1]
        let yDir = [1, -1, 0, 0]
        let dirs:[Direction] = [.down, .up, .right, .left]

        for i in 0..<4 {
            let nextX = x + xDir[i]
            let nextY = y + yDir[i]
            let nextDir = dirs[i]
            let costNext = dirCosts[currDir.rawValue][x][y] + (currDir == nextDir ? 100 : 600)

            guard isInRange(x: nextX, y: nextY) == true,
                  dirCosts[i][nextX][nextY] > costNext else { continue }

            dirCosts[i][nextX][nextY] = costNext
            if board[nextX][nextY] != 1 {
                dfs(nextX, nextY, nextDir)
            }
        }
    }
    dfs(0, 0, .up)
    dfs(0, 0, .left)
    dfs(0, 0, .right)
    dfs(0, 0, .down)

    return dirCosts.map({ $0[board.count - 1][board.count - 1] }).min() as! Int
}