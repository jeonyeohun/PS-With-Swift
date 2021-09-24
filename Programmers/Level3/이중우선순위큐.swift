import Foundation

func solution(_ operations:[String]) -> [Int] {
    var doublyPQ: [Int] = []

    for operation in operations {
        let splitOperation = operation.components(separatedBy: " ")
        switch splitOperation[0] {
        case "I":
            doublyPQ.append(Int(splitOperation[1])!)
        case "D" where splitOperation[1].contains("-") && !doublyPQ.isEmpty:
            doublyPQ.sort(by: >)
            doublyPQ.removeLast()
        case "D" where !doublyPQ.isEmpty:
            doublyPQ.sort(by: <)
            doublyPQ.removeLast()
        default:
            break
        }
    }
    return doublyPQ.isEmpty ? [0, 0] : [doublyPQ.max()!, doublyPQ.min()!]
}