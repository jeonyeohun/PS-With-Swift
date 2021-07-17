import Foundation

func isPrime (_ num: Int) -> Bool {
    for i in 2..<num {
        if num % i == 0 {
            return false
        }
    }
    return true
}

func solution(_ nums:[Int]) -> Int {
    var answer = 0

    for i in 0..<nums.count {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                let number = nums[i] + nums[j] + nums[k];
                if (isPrime(number)) {
                    answer += 1
                }
            }
        }
    }

    return answer
}