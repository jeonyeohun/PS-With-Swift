import Foundation

func decimalToFlipedTenary (_ n: Int) -> String {
    var tenaryCode = ""
    var num = n
    while num > 0 {
        let remainder = "\(num % 3)";
        tenaryCode.append(Character(remainder))
        num /= 3
    }
    
    return tenaryCode
}

func tenaryToDecimal (_ n: String) -> Int {
    var decimal = 0
    for (index, c) in n.enumerated() {
        let exp = Double(n.count - index - 1);
        decimal += Int(pow(3.0, exp)) * c.wholeNumberValue!
    }
    
    return decimal
}

func solution(_ n:Int) -> Int {
    tenaryToDecimal(decimalToFlipedTenary(n))
}