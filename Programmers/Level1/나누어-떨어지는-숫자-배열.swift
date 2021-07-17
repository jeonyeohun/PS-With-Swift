func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    var divideArr = arr.filter({ $0 % divisor == 0 })
    return divideArr.count == 0 ? [-1] : divideArr.sorted()
}