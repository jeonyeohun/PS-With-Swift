import Foundation

let n = Int(readLine()!)!
var stringSet = Set<String>()
var answer = ""

for _ in 0..<n {
    let str = readLine()!
    let reversed = String(str.reversed())
    stringSet.insert(str)
    
    if stringSet.contains(reversed) {
        answer = str
        break
    }
    stringSet.insert(reversed)
}

print("\(answer.count) \(Array(answer)[answer.count / 2])")

