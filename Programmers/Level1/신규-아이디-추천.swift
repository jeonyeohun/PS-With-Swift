import Foundation

func upperToLowerAll (_ str: String) -> String {
    str.lowercased()
}

func eraseViolatedChars (_ str: String) -> String {
    let allowedSpecialChars: [Character] = ["_", "-", "."]
    var newStr = ""
    for c in str {
        if (c.isNumber || c.isLetter || allowedSpecialChars.contains(c)){
            newStr.append(c)
        }
    }
    
    return newStr
}

func eraseConseqDots (_ str: String) -> String {
    var newStr = ""
    for c in str {
        if (c == "." && newStr.last == "."){
            continue
        } else {
            newStr.append(c)
        }
    }
    return newStr
}

func trimFirstLastDot (_ str: String) -> String {
    var newStr = str
    if newStr.first == "." {
        newStr.removeFirst()
    }
    if newStr.last == "." {
        newStr.removeLast()
    }
    
    return newStr
}

func trimOverflowText (_ str: String) -> String {
    if str.count < 16 {
        return str
    }
    return String(str.prefix(upTo: str.index(str.startIndex, offsetBy: 15)))
}

func handleEmptyId (_ str: String) -> String {
    if str.count == 0 {
        return "a"
    }
    return str
}

func fillUntilMinLen (_ str: String) -> String {
    if str.count > 3 {
        return str
    }
    
    var newStr = str
    while newStr.count != 3 {
        newStr.append(newStr.last!)
    }
    
    return newStr
}

func solution(_ new_id:String) -> String {
    var newIdWithRules = upperToLowerAll(new_id)
    newIdWithRules = eraseViolatedChars(newIdWithRules)
    newIdWithRules = eraseConseqDots(newIdWithRules)
    newIdWithRules = trimFirstLastDot(newIdWithRules)
    newIdWithRules = handleEmptyId(newIdWithRules)
    newIdWithRules = trimOverflowText(newIdWithRules)
    newIdWithRules = trimFirstLastDot(newIdWithRules)
    newIdWithRules = fillUntilMinLen(newIdWithRules)
    
    return newIdWithRules
}