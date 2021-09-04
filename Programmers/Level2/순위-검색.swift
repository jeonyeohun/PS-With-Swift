import Foundation

func makeCombination(comb:[Bool], combGroup: inout [[Bool]]) {
    if comb.count == 4 {
        combGroup.append(comb)
        return
    }
    
    makeCombination(comb: comb + [true], combGroup: &combGroup)
    makeCombination(comb: comb + [false], combGroup: &combGroup)
}

func binarySearch(scores:[Int], target: Int) -> Int {
    var left = 0
    var right = scores.count - 1
    var mid = 0
    
    while left <= right {
        mid = (left + right) / 2
        
        if scores[mid] >= target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return left
}

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var combinations: [[Bool]] = []
    makeCombination(comb: [], combGroup: &combinations)
    
    var answer: [Int] = []
    var dict: [String:[Int]] = [:]
    
    for row in info {
        var rowValues = row.components(separatedBy: " ")
        let score = Int(rowValues.removeLast())!
        
        for combination in combinations {
            var rowKey = rowValues
            for i in 0..<combination.count {
                if combination[i] {
                    rowKey[i] = "-"
                }
            }
            let key = rowKey.joined()
            if dict[key] == nil {
                dict[key] = [score]
            } else {
                dict[key]?.append(score)
            }
        }
    }
    
    for key in dict.keys {
        dict[key] = dict[key]?.sorted(by: >)
    }
    
    for request in query {
        answer.append(0)
        var req = request.replacingOccurrences(of: " and ", with: " ").components(separatedBy: " ")
        let score = Int(req.removeLast()) ?? 0
        let requestKey = req.joined()
        
        if let result = dict[requestKey] {
            answer[answer.count - 1] = (binarySearch(scores: result, target: score))
        }
    }
    
    return answer
}

assert(solution(["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"], ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]) == [1,1,1,1,2,4], "wrong")

print("correct")
