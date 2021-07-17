import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var result: [String] = []
    for (a, b) in zip(arr1, arr2) {
        var binarySum = String(a | b, radix: 2)
        while binarySum.count != n {
            binarySum.insert("0", at: binarySum.startIndex)
        }
        binarySum = binarySum.replacingOccurrences(of: "0", with: " ")
        binarySum = binarySum.replacingOccurrences(of: "1", with: "#")
        
        result.append(binarySum)
    }
    
    return result
}