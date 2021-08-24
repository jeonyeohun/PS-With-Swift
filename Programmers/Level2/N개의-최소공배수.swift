import Foundation

func gcd (_ a: Int, _ b: Int) -> Int {
    if b == 0 { return a }
    return gcd(b, a % b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution(_ arr:[Int]) -> Int {
    var answer = arr.first!
    for num in arr {
         answer = lcm(answer, num)
    }
    
    return answer
}