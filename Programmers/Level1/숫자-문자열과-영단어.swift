import Foundation

func isDigit (_ char: Character) -> Bool {
    char >= "0" && char <= "9"
}

func solution(_ s:String) -> Int {
    var result: [Character] = []
    var buffer: [Character] = []
    
    let stringToNumber: [String : Character] = [ "zero": "0", "one" : "1", "two" : "2", "three" : "3", "four" : "4", "five" : "5", "six" : "6" , "seven" : "7", "eight" : "8", "nine" : "9"]
    
    for char in s {
        if (isDigit(char)) {
            result.append(char)
        } else {
            buffer.append(char)
            if let numberChar = stringToNumber[String(buffer)] {
                result.append(numberChar)
                buffer.removeAll()
            }
        }
    }
    
    return Int(String(result))!
}