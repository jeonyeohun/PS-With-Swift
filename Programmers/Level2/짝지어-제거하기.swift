import Foundation

func solution(_ s:String) -> Int{
    var stack: [Character] = []
    
    for c in s {
        if !stack.isEmpty && stack.last! == c {
            stack.removeLast()
        } else {
            stack.append(c)
        }
    }

    return stack.isEmpty ? 1 : 0
}