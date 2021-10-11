import Foundation

func solution(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    var start = 1
    
    // 0...lastStation
    for station in stations {
        answer += Int(ceil((Double(station - w - start) / Double(2 * w + 1))))
        start = station + w + 1
    }
    // lastStation...lastApartment
    if start <= n {
        answer += Int(ceil((Double(n - start + 1) / Double(2 * w + 1))))
    }

    return answer
}