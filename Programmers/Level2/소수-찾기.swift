import Foundation

var visited = Array(repeating: false, count: 8)

func isPrime (_ num : Int) -> Bool {
    if num < 2 {
        return false
    }
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}

func makeCombination (_ numbers : [Character], _ comb : inout [Character], _ primesList: inout Set<Int>) {
    let num = Int(String(comb)) ?? 0
    if isPrime(num) {
        primesList.insert(num)
    }
    
    if numbers.count == comb.count {
        return
    }
    
    for i in 0..<(numbers.count) {
        if visited[i] == false {
            visited[i] = true
            comb.append(numbers[i])
            makeCombination(numbers, &comb, &primesList)
            comb.removeLast()
            visited[i] = false
        }
    }
}

func solution(_ numbers:String) -> Int {
    var combination : [Character] = []
    var primesList : Set<Int> = []
    makeCombination(Array(numbers), &combination, &primesList)
    return primesList.count
}