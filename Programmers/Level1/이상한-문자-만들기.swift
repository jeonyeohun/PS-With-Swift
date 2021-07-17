import Foundation

func solution(_ s:String) -> String {
    let strings = s.components(separatedBy: " ")
    let parsedStrings = strings.map({$0.enumerated().map({(index, char) in 
    index % 2 == 0 ? char.uppercased() : char.lowercased()}).joined()})
    return parsedStrings.joined(separator: " ")
}
