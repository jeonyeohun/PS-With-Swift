import Foundation

func solution(_ s:String) -> [Int] {
    var convertCount = 0
    var zerosCount = 0
    var target = s
    
    while target != "1" {
        let zeros = target.filter({ $0 == "0" }).count
        zerosCount += zeros
        target = String((target.count - zeros), radix: 2)
        convertCount += 1
    }
    
    return [convertCount, zerosCount]
}

solution("110010101001")
solution("01110")
solution("1111111")