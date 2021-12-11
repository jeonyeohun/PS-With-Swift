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
let S = Array(fio.readString())
var answer = 0
var alphaCount = [Character:Int]()

for char in S { alphaCount.updateValue((alphaCount[char] ?? 0) + 1, forKey: char) }
let alphas = [Character](alphaCount.keys)

func solution() -> Int {
    func makeCombination(lastAlpha: Character = Character("."), length: Int = 0) {
        if length == S.count {
            answer += 1
            return
        }
        for alpha in alphas {
            if lastAlpha == alpha || alphaCount[alpha]! <= 0 { continue }
            alphaCount.updateValue(alphaCount[alpha]! - 1, forKey: alpha)
            makeCombination(lastAlpha: alpha, length: length + 1)
            alphaCount.updateValue(alphaCount[alpha]! + 1, forKey: alpha)
        }
    }
    if alphaCount.values.allSatisfy({ $0 == 1 }) {
        return (1...S.count).reduce(1, *)
    } else {
        makeCombination()
        return answer
    }
}

fio.print("\(solution())")

