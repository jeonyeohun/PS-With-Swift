import Foundation

func solution(_ numbers:[Int]) -> Int {
    let total = 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 
    return total - numbers.reduce(0, +)
}