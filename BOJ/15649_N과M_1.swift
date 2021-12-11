import Foundation

final class FileIO {
    private let buffer: Data
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        self.buffer = try! fileHandle.readToEnd()! // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer {
            index += 1
        }
        guard index < buffer.count else { return 0 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}


func dfs(n: Int, m: Int, sequence: [Int], visited: [Bool]) {
    var sequence = sequence
    var visited = visited
    if sequence.count == m {
        print(sequence.map({ String($0) }).joined(separator: " "))
        return
    }
    
    for i in 1...n {
        if !visited[i] {
            visited[i] = true
            sequence.append(i)
            dfs(n: n, m: m, sequence: sequence, visited: visited)
            sequence.removeLast()
            visited[i] = false
        }
    }
}


let io = FileIO()

let n = io.readInt()
let m = io.readInt()
let numbers = Array(1...n)

dfs(n: n, m: m, sequence: [], visited: Array(repeating: false, count: n + 1))


