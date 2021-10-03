import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var parent: [Int] = []
    var level: [Int] = []
    
    for i in 0...n {
        parent.append(i)
        level.append(0)
    }
    
    func find(x: Int) -> Int {
        if parent[x] == x { return x }
        else {
            parent[x] = find(x: parent[x])
            return parent[x]
        }
    }
    
    func union(a: Int, b: Int) -> Bool {
        var a = find(x: a)
        var b = find(x: b)
        
        if a == b { return false }
        
        if level[a] > level[b] {
            swap(&a, &b)
        }
        if level[a] == level[b] {
            level[b] += 1
        }
        parent[a] = b
        return true
    }
    
    let sortedEdgesByCost = costs.sorted(by: { $0[2] < $1[2] })
    
    var totalCost = 0
    for edge in sortedEdgesByCost {
        if union(a: edge[0], b: edge[1]) {
            totalCost += edge[2]
        }
    }
    
    return totalCost
}