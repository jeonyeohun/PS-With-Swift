import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var sum = 0
    for num in left...right {
        var i = 1
        var divisorCount = 0
        
        while i * i <= num {
            if num % i == 0 {
                divisorCount += num / i == i ? 1 : 2
            }
            i += 1
        }
        sum += divisorCount % 2 == 0 ? num : -num
    }
    
    return sum
}