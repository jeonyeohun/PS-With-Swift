import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue:[(index:Int, priority:Int)] = []
    
    for (index, priority) in priorities.enumerated() {
        queue.append((index: index, priority: priority))
    }
    
    var popCount = 0
    while !queue.isEmpty {
        let front = queue.remove(at: queue.startIndex)
        if queue.allSatisfy({ front.priority >= $0.priority }) {
            popCount += 1
            if front.index == location {
                break
            }
        } else {
            queue.append(front)
        }
    }
    
    return popCount
}