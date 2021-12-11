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
let F = fio.readInt()
let S = fio.readInt()
let G = fio.readInt()
let U = fio.readInt()
let D = fio.readInt()
var visited = Array(repeating: false, count: F + 1)

func bfs() {
    var queue = [(floor: Int, steps: Int)]()
    queue.append((S, 0))
    
    while !queue.isEmpty {
        let now = queue.removeFirst()
        if now.floor == G {
            fio.print("\(now.steps)")
            return
        }
        
        if now.floor - D > 0 && !visited[now.floor - D] {
            queue.append((now.floor - D, now.steps + 1))
            visited[now.floor - D] = true
        }
        if now.floor + U <= F && !visited[now.floor + U] {
            queue.append((now.floor + U, now.steps + 1))
            visited[now.floor + U] = true
        }
    }
    fio.print("use the stairs")
    return
}

bfs()