import Foundation

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    let map = board.map({ Array($0) })
    var stackMap:[[Character]] = Array(repeating: [], count: n)
    for i in 0..<m {
        for j in 0..<n {
            stackMap[j].insert(map[i][j], at: 0)
        }
    }

    while true {
        var nextMap = stackMap
        var isMatched = false
        for i in 0..<n-1 {
            if nextMap[i].isEmpty { continue }
            for j in 0..<nextMap[i].count-1 {
                if j + 1 > nextMap[i + 1].count - 1
                    || j + 1 > nextMap[i].count - 1
                    || i + 1 > nextMap.count - 1 { continue }
                if Set([stackMap[i][j], stackMap[i][j + 1], stackMap[i + 1][j + 1], stackMap[i + 1][j]]).count == 1 {
                    nextMap[i][j] = "-"
                    nextMap[i][j + 1] = "-"
                    nextMap[i + 1][j + 1] = "-"
                    nextMap[i + 1][j] = "-"
                    isMatched = true
                }
            }
        }
        stackMap = nextMap.map({ $0.filter({ elem in elem != "-" }) })
        if isMatched == false { break }
    }
    
    return n * m - stackMap.map({ $0.count }).reduce(0, +)
}