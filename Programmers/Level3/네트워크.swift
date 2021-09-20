import Foundation

func find(x: Int, parent: inout [Int]) -> Int {
    if(parent[x] == x) { return x }
    else { return find(x: parent[x], parent: &parent) }
}

func union(a: Int, b: Int, parent: inout [Int], level: inout [Int]) {
    let a = find(x: a, parent: &parent)
    let b = find(x: b, parent: &parent)
    if a == b { return }
    
    if level[a] >= level[b] {
        parent[b] = a
    } else {
        parent[a] = b
    }
    
    if level[a] == level[b] {
        level[b] += 1
    }
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var parent: [Int] = []
    var level: [Int] = []
    for i in 0..<n {
        parent.append(i)
        level.append(0)
    }
    for (cIndex, computer) in computers.enumerated() {
        for (nIndex, network) in computer.enumerated() {
            if network == 1 {
                union(a: cIndex, b: nIndex, parent: &parent, level: &level)
            }
        }
    }
    for i in 0..<n {
        parent[i] = find(x: i, parent: &parent)
    }
    
    return Set(parent).count
}