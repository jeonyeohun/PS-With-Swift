import Foundation

let N = readLine()!.components(separatedBy: " ").map{ Int($0)!}.first!
let M = readLine()!.components(separatedBy: " ").map{ Int($0)!}.first!
let S = readLine()!

let pn = Array(repeating: "IO", count: N).reduce("", +) + "I"
let targetString = Array(S)

var answer = 0

for i in 0..<S.count -  (N * 2 + 1) {
    let subString = String(targetString[i..<i+(N * 2 + 1)])
    if subString == pn {
        answer += 1
    }
}

print(answer)