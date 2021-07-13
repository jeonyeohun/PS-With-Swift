import Foundation

func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var sum:Int = 0;
    
    for (num, sign) in zip(absolutes, signs) {
        sum += ((sign == true) ? num : (num * -1))
    } 
    
    return sum
}