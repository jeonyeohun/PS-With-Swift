import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var stageInfo : [(Int, Double)] = []
    for stage in 1...N {
        var challengerCount = 0.0
        var failureCount = 0.0 

        for userAt in stages {
             if userAt >= stage {
                challengerCount += 1
            }
            if userAt == stage {
                failureCount += 1
            }
        }
        
        challengerCount == 0
            ? stageInfo.append((stage, 0))
            : stageInfo.append((stage, failureCount / challengerCount))
    }

    return stageInfo.sorted(by: { $0.1 > $1.1 }).map({ $0.0 })
}