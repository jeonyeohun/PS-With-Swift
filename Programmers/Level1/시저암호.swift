func addAscii (_ initalValue: Character, _ steps: Int) -> Character{
    let initialAscii = initalValue.asciiValue!
    let sum = initialAscii + UInt8(steps)
    
    if initalValue.isLowercase && sum > 122 {
        return Character(UnicodeScalar(sum - 122 + 96))
    } else if initalValue.isUppercase && sum > 90 {
        return Character(UnicodeScalar(sum - 90 + 64))
    } else {
        return Character(UnicodeScalar(sum))
    }
}

func solution(_ s:String, _ n:Int) -> String {
    return String(s.map({ $0.isWhitespace ? $0 : addAscii($0, n) }))
}

// 더 좋은 코드

func solution(_ s:String, _ n:Int) -> String {
    return s.utf8.map {
        var code = Int($0)
        switch code {
            case 65...90:
                code = (code + n - 65) % 26 + 65
            case 97...122:
                code = (code + n - 97) % 26 + 97
            default:
                break
        }
        return String(UnicodeScalar(code)!)
    }.joined()
}