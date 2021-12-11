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
let T = fio.readInt()
var map = Array(repeating: Array(repeating: 0, count: M), count: N)
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var visitedWithGram = Array(repeating: Array(repeating: false, count: M), count: N)

for row in 0..<N {
    for col in 0..<M {
        map[row][col] = fio.readInt()
    }
}

var answer = 987654321

func bfs() {
    let rowDir = [1, -1, 0, 0]
    let colDir = [0, 0, 1, -1]
    var queue = [(row: Int, col: Int, step: Int, holdGram: Bool)]()
    queue.append((0, 0, 0, false))
    visited[0][0] = true
    
    while !queue.isEmpty {
        let now = queue.removeFirst()
    
        if now.row == N - 1 && now.col == M - 1 {
            answer = min(answer, now.step)
        }
        for (rowStep, colStep) in zip(rowDir, colDir) {
            let nextRow = now.row + rowStep
            let nextCol = now.col + colStep

            if 0..<N ~= nextRow && 0..<M ~= nextCol && (now.holdGram == true || map[nextRow][nextCol] != 1) {
                if now.holdGram == true && visitedWithGram[nextRow][nextCol] == true
                    || now.holdGram == false && visited[nextRow][nextCol] == true {
                    continue
                }
                now.holdGram
                ? (visitedWithGram[nextRow][nextCol] = true)
                : (visited[nextRow][nextCol] = true)
                
                map[nextRow][nextCol] == 2
                ? queue.append((nextRow, nextCol, now.step + 1, true))
                : queue.append((nextRow, nextCol, now.step + 1, now.holdGram))
            }
        }
    }
}

bfs()
fio.print(answer <= T ? "\(answer)" : "Fail")

