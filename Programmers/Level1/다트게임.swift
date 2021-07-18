import Foundation

func solution(_ dartResult:String) -> Int {
    var buffer: [Int] = []
    let results = dartResult.replacingOccurrences(of: "10", with: "!")
    for c in results {
        if c.isNumber {
            buffer.append(Int(String(c))!)
        }
        switch c {
        case "!":
            buffer.append(10)
        case "S":
            buffer[buffer.endIndex - 1] = Int(pow(Double(buffer.last!), 1))
        case "D":
            buffer[buffer.endIndex - 1] = Int(pow(Double(buffer.last!), 2))
        case "T":
            buffer[buffer.endIndex - 1] = Int(pow(Double(buffer.last!), 3))
        case "#":
            buffer[buffer.endIndex - 1] *= -1
        case "*":
            if buffer.count >= 2 {
                buffer[buffer.index(before: buffer.endIndex - 1)] *= 2
            }
            buffer[buffer.endIndex - 1] *= 2
        default:
            break
        }
    }

    return buffer.reduce(0, +)
}
