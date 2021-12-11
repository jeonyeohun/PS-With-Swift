import Foundation

let valueArr = readLine()!.components(separatedBy: " ").map{ Int($0)!}
let n = valueArr[0]
let m = valueArr[1]
var visited = Array(repeating: false, count: n + 1)

func calcPermutation(sequence: [Int], index: Int) {
    var sequence = sequence
    if sequence.count == m {
        print(sequence.map({ String($0) }).joined(separator: " "))
        return
    }
    
    for i in index...n {
        if !visited[i] {
            if (!sequence.isEmpty && sequence.last! > i) {
                continue
            }
            visited[i] = true
            sequence.append(i)
            calcPermutation(sequence: sequence, index: index + 1)
            sequence.removeLast()
            visited[i] = false
        }
    }
}

calcPermutation(sequence: [], index: 1)

