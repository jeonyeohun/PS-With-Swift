import Foundation

let firstInput = readLine()!.components(separatedBy: " ").map{ Int($0)!}
let N = firstInput[0]
let K = firstInput[1]
let kits = readLine()!.components(separatedBy: " ").map{ Int($0)!}
var combinations: [[Int]] = []
var visited = Array(repeating: false, count: N + 1)

func makeCombination(max: Int, comb: [Int]) {
    var comb = comb
    if comb.count == max {
        var weight = 500
        for kit in comb {
            weight = weight + kit - K
            if weight < 500 {
                return
            }
        }
        combinations.append(comb)
        return
    }
    
    for (index, kit) in kits.enumerated() {
        if visited[index] == false {
            visited[index] = true
            comb.append(kit)
            makeCombination(max: max, comb: comb)
            comb.removeLast()
            visited[index] = false
        }
    }
}

makeCombination(max: N, comb: [])
print(combinations.count)

