import Foundation

func solution(_ n:Int) -> Int {
    var nextBigNum = n
    let srcNumBinary = String(n, radix: 2)
    while true {
        nextBigNum += 1
        let nextNumBinary = String(nextBigNum, radix: 2)
        if srcNumBinary.filter({$0 == "1"}).count
            == nextNumBinary.filter({$0 == "1"}).count {
            return Int(nextNumBinary, radix: 2)!
        }
    }
}