import Foundation

func isBalanced(_ s: [Character]) -> Bool {
    var stack: [Character] = []
    let braces: [Character:Character] = ["{":"}", "[":"]", "(":")"]
    for i in s {
        if !stack.isEmpty && braces[stack.last!] == i {
            stack.removeLast()
        } else {
            stack.append(i)
        }
    }
    return stack.isEmpty
}

func solution(_ s:String) -> Int {
    var str = Array(s)
    print(type(of: str))
    var answer = 0
    for _ in str {
        str.append(str.removeFirst())
        if isBalanced(str) {
            answer += 1
        }
    }
    
    return answer
}