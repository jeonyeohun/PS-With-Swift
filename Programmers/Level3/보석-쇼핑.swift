import Foundation

func solution(_ gems:[String]) -> [Int] {
    var uniqueGems:[String: Int] = [:]
    gems.forEach { gem in uniqueGems.updateValue((uniqueGems[gem] ?? 0) + 1, forKey: gem) }
    
    var start = 0
    var end = 0
    var answer:(start:Int, end:Int) = (start, end)
    var minDist = 987654321
    while start <= end {
        if uniqueGems.allSatisfy({ $0.value == true }) {
            if minDist > end-start {
                answer = (start, end)
                minDist = end - start
            }
            uniqueGems[gems[start]] = false
            start += 1
        } else {
            end += 1
            if end >= gems.count { break }
            uniqueGems[gems[end]] = true
        }
    }
   
    return [answer.start + 1, answer.end + 1]
}

print(solution(["DIA", "RUBY", "RUBY", "DIA", "DIA", "EMERALD", "SAPPHIRE", "DIA"]))
print(solution(["AA", "AB", "AC", "AA", "AC"]))
print(solution(["XYZ", "XYZ", "XYZ"]))
