import Foundation

func dijikstra(adjList: [[Int]]) -> Int {
    var dist = Array(repeating: 987654321, count: adjList.count)
    var queue: [Int] = []
    queue.append(1)
    dist[0] = 0
    dist[1] = 0
    
    while !queue.isEmpty {
        let here = queue.removeFirst()
        for there in adjList[here] {
            if dist[there] > dist[here] + 1 {
                dist[there] = dist[here] + 1
                queue.append(there)
            }
        }
    }
    let max = dist.max()
    return dist.filter({ max == $0 }).count
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var adjList: [[Int]] = Array(repeating: [], count: n + 1)
    for edgeInfo in edge {
        adjList[edgeInfo[0]].append(edgeInfo[1])
        adjList[edgeInfo[1]].append(edgeInfo[0])
    }
    return dijikstra(adjList: adjList)
}