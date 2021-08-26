// 시간초과가 나는 코드
// import Foundation

// func solution(_ numbers:[Int64]) -> [Int64] {
//     let answer = numbers.map({ number -> Int64 in
//         let numberString = String(repeating: "0", count: number.leadingZeroBitCount) + String(number, radix: 2)
        
//         var next = number + 1
//         while true {
//             var diffCount = 0
//             let nextString = String(repeating: "0", count: next.leadingZeroBitCount) + String(next, radix: 2)
            
//             for (orig, next) in zip(numberString, nextString) {
//                 if orig != next { diffCount += 1 }
//             }

//             if diffCount == 1 || diffCount == 2 {
//                 return Int64(exactly: next)!
//             }
            
//             next += 1
//         }
//     })
    
//     return answer
// }


import Foundation

func solution(_ numbers:[Int64]) -> [Int64] {
    return numbers.map({ number -> Int64 in
        if number % 2 == 0 {
            return number + 1
        } else {
            let zeroComplement = (~number) & (number + 1)
            return (number | zeroComplement) & ~(zeroComplement >> 1)
        }
    })
}