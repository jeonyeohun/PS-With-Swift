import Foundation

func isHIndex (_ citations:[Int], _ index:Int) -> Bool {
    return citations.filter({ $0 >= index }).count >= index
}

func binarySearch (_ start:Int, _ end:Int, _ citations:[Int]) -> Int{
    
    var head = start
    var tail = end
    var mid = (start + end) / 2
    var hIndex = 0
    
    while head <= tail {
        mid = (head + tail) / 2
        if isHIndex(citations, mid) {
            head = mid + 1
            hIndex = mid
        }else {
            tail = mid - 1
        }
    }
    return hIndex
}

func solution(_ citations:[Int]) -> Int {
    return binarySearch(0, citations.count, citations)
}