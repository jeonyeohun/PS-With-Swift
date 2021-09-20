import Foundation

func calcTime(time:[Int64], minTime: Int64) -> Int64 {
    return time.reduce(Int64(0), { $0 + minTime / $1 })
}

func binarySearch(n: Int64, time: [Int64]) -> Int64 {
    var start: Int64 = 1
    var end: Int64 = 10000000000000
    var result: Int64 = 0
    
    while start <= end {
        let mid: Int64 = (start + end) / 2
        if calcTime(time: time, minTime: mid) >= n {
            result = mid
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return result
}

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let times = times.map({ Int64($0) })
    return binarySearch(n: Int64(n), time: times)
}