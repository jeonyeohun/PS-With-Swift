import Foundation

func solution(_ s:String) -> Bool {
    var openBraceCount = 0
    
    for c in s {
        if openBraceCount > 0 && c == ")" {
            openBraceCount -= 1
        } else {
            openBraceCount += 1
        }
    }

    return openBraceCount == 0
}