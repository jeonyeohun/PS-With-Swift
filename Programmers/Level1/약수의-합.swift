import Foundation

func solution(_ n:Int) -> Int {
    if n < 2 {
        return n
    }
    var answer = 0
    for i in 1...Int(sqrt(Double(n))) {
        if n % i == 0 {
            answer += i + n/i
            if (i * i == n) {
                answer -= i
            }
        }
    }
    return answer
}

// 더 좋은 풀이

func solution(_ n:Int) -> Int {   
    guard n != 0 else {
        return 0
    }
    return Array(1...n).filter{n % $0 == 0}.reduce(0, +)
}