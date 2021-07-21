import Foundation

func solution(_ numbers:[Int]) -> String {
    if numbers.allSatisfy({$0 == 0}) {
        return "0"
    }
    let sortedNums = numbers.sorted(by: { "\($0)\($1)" > "\($1)\($0)" })
    return sortedNums.map({ "\($0)" }).joined()
}