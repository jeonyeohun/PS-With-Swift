import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {

    for col in 3...yellow + 2 {
        for row in 3...col {
            if (col - 2) * (row - 2) == yellow 
            && col * row == brown + yellow {
                return [ col, row ]
            }
        }
    }
    return []
}