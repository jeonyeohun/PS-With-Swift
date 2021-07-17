import Foundation

func solution(_ n:Int64) -> Int64 {
    let num = sqrt(Double(n))
    if Int64(num) * Int64(num) == n {
        return Int64(pow(num + 1, 2))
    } else {
        return -1
    }
}