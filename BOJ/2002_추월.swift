import Foundation

let numOfCars = Int(readLine()!)!
var orderDict = [String: Int]()

for order in 1...numOfCars {
    let car = readLine()!
    orderDict[car, default: 0] = order
}

var answer = 0
var visited = Array(repeating: false, count: numOfCars + 1)
visited[0] = true

for _ in 0..<numOfCars {
    let car = readLine()!
    for i in 0..<orderDict[car]! {
        if !visited[i] {
            answer += 1
            break
        }
    }
    visited[orderDict[car]!] = true
}

print(answer)

