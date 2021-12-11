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

struct ProcessHeap {
    var elements = [Process]()
    private let sort = { (p1: Process, p2: Process) -> Bool in
        if p1.priority == p2.priority { return p1.id < p2.id }
        return p1.priority > p2.priority
    }
    
    mutating func swimUp(from node: Int) {
        var nowIndex = node
        var parentIndex = nowIndex / 2
    
        while nowIndex > 0 && self.sort(self.elements[nowIndex], self.elements[parentIndex]) {
            self.elements.swapAt(nowIndex, parentIndex)
            nowIndex = parentIndex
            parentIndex = nowIndex / 2
        }
    }
    
    mutating func diveDown(from node: Int) {
        var nowIndex = node
        
        while true {
            let leftIndex = nowIndex * 2
            let rightIndex = nowIndex * 2 + 1
            var candIndex = nowIndex
            
            if leftIndex < self.elements.count && sort(self.elements[leftIndex], self.elements[candIndex]) {
                candIndex = leftIndex
            }
            if rightIndex < self.elements.count && sort(self.elements[rightIndex], self.elements[candIndex]) {
                candIndex = rightIndex
            }
            if candIndex == nowIndex {
                return
            }
            self.elements.swapAt(nowIndex, candIndex)
            nowIndex = candIndex
        }
    }
    
    mutating func insert(node: Process) {
        self.elements.append(node)
        self.swimUp(from: self.elements.endIndex - 1)
    }
    
    mutating func remove() -> Process? {
        guard !self.elements.isEmpty else { return nil }
        
        self.elements.swapAt(0, self.elements.endIndex - 1)
        let del = self.elements.removeLast()
        
        self.diveDown(from: 0)
        
        return del
    }
}

struct PQ {
    var heap = ProcessHeap()
    
    var isEmpty: Bool {
        self.heap.elements.isEmpty
    }
    
    mutating func push(process: Process) {
        self.heap.insert(node: process)
    }
    
    mutating func pop() -> Process? {
        self.heap.remove()
    }
}

let fio = FastIO()
var readyQueue = PQ()
let T = fio.readInt()
let n = fio.readInt()

typealias Process = (id: Int, requiredTime: Int, priority: Int)

for _ in 0..<n {
    let a = fio.readInt()
    let b = fio.readInt()
    let c = fio.readInt()
    readyQueue.push(process: Process(id: a, requiredTime: b, priority: c))
}

var output = ""
for _ in 0..<T {
    guard !readyQueue.isEmpty else { break }
    let scheduledProcess = readyQueue.pop()!
    if scheduledProcess.requiredTime - 1 > 0 {
        readyQueue.push(process: Process(
            id: scheduledProcess.id,
            requiredTime: scheduledProcess.requiredTime - 1,
            priority: scheduledProcess.priority - 1
        ))
    }
    output += ("\(scheduledProcess.id)" + "\n")
}

fio.print(output)

