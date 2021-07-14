import Foundation

func getNextElement (_ targetArray: [Int], _ index: Int) -> Int{
    return targetArray[index % targetArray.count]
}

func solution(_ answers:[Int]) -> [Int] {
    let firstSupo: [Int] = [1, 2, 3, 4, 5]
    let secondSupo: [Int] = [2, 1, 2, 3, 2, 4, 2, 5]
    let thirdSupo: [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var correctCounts: [Int] = [0, 0, 0]
    
    for (index, answer) in answers.enumerated() {
        if (getNextElement(firstSupo, index) == answer) {
            correctCounts[0]+=1
        }
        if (getNextElement(secondSupo, index) == answer) {
            correctCounts[1]+=1
        }
        if (getNextElement(thirdSupo, index) == answer) {
            correctCounts[2]+=1
        }
    }
    
    let maxCorrects = correctCounts.max()
    var answer:[Int] = []
    for (index, correct) in correctCounts.enumerated() {
        if (correct == maxCorrects) {
            answer.append(index+1)
        }
    }
    
    
    return answer
}