import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = [];
    
    for command in commands {
        let start = command[0]-1
        let end = command[1]-1
        let k = command[2]-1
        
        var splitArray = Array(array[start...end])
        splitArray.sort(by: <)
        answer.append(splitArray[k])
    }
    return answer
}