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

var testNum = 1
while true {
    let input = fio.readString()
    if input.contains("-") { break }
    var stack = [Character]()
    var answer = 0
    for char in input {
        if !stack.isEmpty && stack.last! == "{" && char == "}" {
            _ = stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    
    if !stack.isEmpty {
        for i in stride(from: 0, through: stack.count-1, by: 2) {
            if stack[i] == stack[i+1] {
                answer += 1
            } else {
                answer += 2
            }
        }
    }
    
    fio.print("\(testNum). \(answer)\n")
    testNum += 1
}



