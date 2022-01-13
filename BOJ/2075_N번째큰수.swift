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

struct Heap {
    var elements: [Int] = [-1]
    func leftChild(of index: Int) -> Int {
        return index * 2
    }
    func rightChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    func parent(of index: Int) -> Int {
        return index / 2
    }
    mutating func add(element: Int) {
        elements.append(element)
    }
    mutating func diveDown(from index: Int) {
        var largest = index
        let leftIndex = self.leftChild(of: index)
        let rightIndex = self.rightChild(of: index)
        
        if leftIndex < elements.endIndex && elements[leftIndex] > elements[index] {
            largest = leftIndex
        }
        if rightIndex < elements.endIndex && elements[rightIndex] > elements[largest] {
            largest = rightIndex
        }
        if largest != index {
            elements.swapAt(largest, index)
            self.diveDown(from: largest)
        }
    }
    mutating func swimUp(from index: Int) {
        var index = index
        while index > 1 && self.elements[index/2] < self.elements[index] {
            self.elements.swapAt(index/2, index)
            index /= 2
        }
    }
    mutating func insert(node: Int) {
        self.elements.append(node)
        self.swimUp(from: self.elements.endIndex - 1)
    }
    mutating func remove() -> Int? {
        if self.elements.count == 1 { return nil }
        self.elements.swapAt(1, elements.endIndex - 1)
        let deleted = elements.removeLast()
        self.diveDown(from: 1)
        
        return deleted
    }
}

struct PriorityQueue {
    private var heap = Heap()
    var isEmpty: Bool {
        return heap.elements.count == 1
    }
    func peak() -> Int {
        return self.heap.elements[1]
    }
    mutating func push(element: Int) {
        return self.heap.insert(node: element)
    }
    mutating func pop() -> Int? {
        return self.heap.remove()
    }
}

let fio = FastIO()
let n = fio.readInt()
var pq = PriorityQueue()

for _ in 0..<(n*n) {
    pq.push(element: fio.readInt())
}

for _ in 0..<n-1 {
    _ = pq.pop()
}

print(pq.peak())
