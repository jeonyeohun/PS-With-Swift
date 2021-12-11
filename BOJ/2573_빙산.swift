import Foundation

final class FastIO {
    private let buffer: [UInt8]
    private var index: Int = 0
    private let fhOutput: FileHandle = FileHandle.standardOutput
    
    init(fhInput: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fhInput.readToEnd()!) + [UInt8(0)]
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer {
            index += 1
        }
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        while now == 10 || now == 32 {
            now = read()
        }
        if now == 45 {
            isPositive.toggle(); now = read()
        }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now - 48)
            now = read()
        }
        return sum * (isPositive ? 1 : -1)
    }
    
    @inline(__always) func readString() -> String {
        var now = read()
        while now == 10 || now == 32 {
            now = read()
        }
        let beginIndex = index-1
        while now != 10, now != 32, now != 0 {
            now = read()
        }
        return String(bytes: Array(buffer[beginIndex..<(index-1)]), encoding: .ascii)!
    }
    
    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        while now == 10 || now == 32 {
            now = read()
        }
        let beginIndex = index - 1
        while now != 10,
              now != 32,
              now != 0 {
            now = read()
        }
        return Array(buffer[beginIndex..<(index - 1)])
    }
    
    @inline(__always) func print(_ s: String) {
        fhOutput.write(s.data(using: .utf8)!)
    }
}

let fio = FastIO()
let N = fio.readInt()
let M = fio.readInt()
var map = Array(repeating: Array(repeating: 0, count: M), count: N)

for row in 0..<N {
    for col in 0..<M {
        map[row][col] = fio.readInt()
    }
}

func countIslands() -> Int{
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    func dfs(row: Int, col: Int) {
        let rowDir = [0, 0, 1, -1]
        let colDir = [1, -1, 0, 0]
        visited[row][col] = true
        
        for (rowMove, colMove) in zip(rowDir, colDir) {
            let nextRow = row + rowMove
            let nextCol = col + colMove
            
            if 0..<N ~= nextRow && 0..<M ~= nextCol && !visited[nextRow][nextCol] && map[nextRow][nextCol] > 0 {
                dfs(row: nextRow, col: nextCol)
            }
        }
    }
    
    var islandCount = 0
    for (rowIndex, row) in map.enumerated() {
        if rowIndex == 0 || rowIndex == N - 1 { continue }
        for (colIndex, col) in row.enumerated() {
            if colIndex == 0 || colIndex == M - 1 { continue }
            if col > 0 && !visited[rowIndex][colIndex] {
                islandCount += 1
                dfs(row: rowIndex, col: colIndex)
            }
            if islandCount >= 2 { return islandCount }
        }
    }
    return islandCount
}

func yearSpent() -> [[Int]]{
    var copiedMap = map
    for i in 1..<N-1 {
        for j in 1..<M-1 {
            if map[i][j] > 0 {
                if map[i + 1][j] <= 0 { copiedMap[i][j] -= 1 }
                if map[i - 1][j] <= 0 { copiedMap[i][j] -= 1 }
                if map[i][j + 1] <= 0 { copiedMap[i][j] -= 1 }
                if map[i][j - 1] <= 0 { copiedMap[i][j] -= 1 }
            }
        }
    }
    return copiedMap
}

var answer = 0
while true {
    let numOfIslands = countIslands()
    if numOfIslands == 0 {
        answer = 0
        break
    }
    if numOfIslands >= 2 {
        break
    }
    answer += 1
    map = yearSpent()
}

fio.print("\(answer)")

