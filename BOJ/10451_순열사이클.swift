import Foundation

let testCount = Int(readLine()!)!

for _ in 0..<testCount {
    _ = Int(readLine()!)!
    let sequence = readLine()!.components(separatedBy: " ").map{ Int($0)!}
    var edges = Array(repeating: [Int](), count: sequence.count + 1)
    var visited = Array(repeating: false, count: sequence.count + 1)
    var isDone = Array(repeating: false, count: sequence.count + 1)
    var cycles = 0
    
    for (index, number) in sequence.enumerated() {
        edges[index + 1].append(number)
    }
    
    func dfs(now: Int) {
        visited[now] = true
        for next in edges[now] {
            if visited[next] && !isDone[next] {
                cycles += 1
                return
            }
            if !isDone[next] && !visited[next] {
                dfs(now: next)
            }
        }
        isDone[now] = true
    }
    
    for number in sequence {
        if !visited[number] {
            dfs(now: number)
        }
    }
    print(cycles)
}

