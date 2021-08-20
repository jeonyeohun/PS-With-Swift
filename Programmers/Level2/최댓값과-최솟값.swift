import Foundation

func solution(_ s:String) -> String {
    let nums = s.components(separatedBy: " ").map({ Int($0)! })
    let min = nums.min()!
    let max = nums.max()!
    
    return "\(String(describing: min)) \(String(describing: max))"
}