import Foundation

func solution(_ n:Int) -> Int {
    var primes:[Bool] = Array(repeating: true, count: n + 1)
    primes[0] = false
    primes[1] = false
    
    for i in 2...n {
        for j in stride(from: i + i, to: n + 1, by: i)  {
            primes[j] = false
        }
    }
    
    return primes.filter({ $0 == true }).count
}