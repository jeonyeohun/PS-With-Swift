// 재귀로 풀이
import Foundation

func erase(_ number: inout [Character], _ k: inout Int, _ eraseCount: Int) -> [Character]{
    let size = number.count
    if k == eraseCount {
        return number
    }
    
    for i in 0..<number.count-1 {
        if number[i] < number[i + 1] {
            number.remove(at: i)
            break
        }
    }
    
    if number.count == size {
        number.removeLast()
    }
    
    return erase(&number, &k, eraseCount + 1)
}

func solution(_ number:String, _ k:Int) -> String {
    var nums = Array(number)
    var eraseNum = k
    
    return String(erase(&nums, &eraseNum, 0))
}


// 반복문 풀이

import Foundation
func solution(_ number:String, _ k:Int) -> String {
    var nums = Array(number)
    var eraseNum = k
    
    while eraseNum != 0 {
        let size = nums.count
        for i in 0..<nums.count - 1 {
            if nums[i] < nums[i + 1] {
                nums.remove(at: i)
                break
            }
        }
        
        if nums.count == size {
            nums.removeLast()
        }
        
        eraseNum -= 1
    }
    
    
    return String(nums)
}