import Foundation

func splitBalanceString (_ p: String) -> (String, String){
    var leftBraceCount = 0
    var rightBraceCount = 0
    
    for (index, i) in p.enumerated() {
        if i == "(" {
            leftBraceCount += 1
        } else {
            rightBraceCount += 1
        }
        
        if leftBraceCount == rightBraceCount {
            return (String(p.prefix(index + 1)), String(p.suffix(p.count - index - 1)))
        }
    }
    
    return ("", p)
}

func isRightBalancedString (_ str: String) -> Bool {
    var stack : [Character] = []
    
    for i in str {
        if !stack.isEmpty && stack.last == "(" && i == ")" {
            stack.removeLast()
        } else {
            stack.append(i)
        }
    }
    return stack.isEmpty
}

func solution(_ p:String) -> String {
    // 1. 빈문자열의 경우 빈 문자열을 반환
    if p.isEmpty {
        return ""
    }
    
    // 2. 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리합니다. 단, u는 "균형잡힌 괄호 문자열"로 더 이상 분리할 수 없어야 하며, v는 빈 문자열이 될 수 있습니다.
    var (u, v) = splitBalanceString(p)

    // 3. 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행합니다.
    if isRightBalancedString(u) {
        // 3-1. 수행한 결과 문자열을 u에 이어 붙인 후 반환합니다.
        return u + solution(v)
    } else {
    // 4. 문자열 u가 "올바른 괄호 문자열"이 아니라면 아래 과정을 수행합니다.
        // 4-1. 빈 문자열에 첫 번째 문자로 '('를 붙입니다.
        var newString = "("
        
        //  4-2. 문자열 v에 대해 1단계부터 재귀적으로 수행한 결과 문자열을 이어 붙입니다.
        newString += solution(v)
    
        // 4-3. ')'를 다시 붙입니다.
        newString += ")"
    
        // 4-4. u의 첫 번째와 마지막 문자를 제거하고, 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙입니다.
        u.removeFirst()
        u.removeLast()
        for brace in u {
            newString += brace == ")" ? "(" : ")"
        }
        return newString
    }
}
