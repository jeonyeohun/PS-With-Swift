import Foundation

func isUnique(relation: [[String]], columns: [Int]) -> Bool {
    var uniqueColumn : Set<String> = []
    for row in relation {
        var rowInfo = ""
        
        for column in columns {
            rowInfo += row[column]
        }
        
        if uniqueColumn.contains(rowInfo) {
            return false
        }
        
        uniqueColumn.insert(rowInfo)
    }
    return true
}

func isMinimal(relation: [[String]], key: [Int]) -> Bool {
    for i in 1..<key.count {
        var comb: [Int] = []
        var allCombs: [[Int]] = []
        makeComb(attributes: key, comb: &comb, allCombs: &allCombs, maxIndex: key.count, index: 0, combSize: i)
     
        for attr in allCombs {
            if isUnique(relation: relation, columns: attr) {
                return false
            }
        }
    }
    return true
}

func makeComb(comb: inout [Int], allCombs: inout [[Int]], maxIndex: Int, index: Int, combSize: Int) {
    if comb.count == combSize {
        allCombs.append(comb)
        return
    }
    
    for i in index..<maxIndex {
        comb.append(i)
        makeComb(comb: &comb, allCombs: &allCombs, maxIndex: maxIndex, index: i + 1, combSize: combSize)
        comb.removeLast()
    }
}

func makeComb(attributes: [Int], comb: inout [Int], allCombs: inout [[Int]], maxIndex: Int, index: Int, combSize: Int) {
    if comb.count == combSize {
        allCombs.append(comb)
        return
    }
    
    for i in index..<maxIndex {
        comb.append(attributes[i])
        makeComb(attributes: attributes, comb: &comb, allCombs: &allCombs, maxIndex: maxIndex, index: i + 1, combSize: combSize)
        comb.removeLast()
    }
}

func solution(_ relation:[[String]]) -> Int {
    var answer = 0
    for i in 1...relation.first!.count {
        var currentComb: [Int] = []
        var allCombs: [[Int]] = []
        
        makeComb(comb: &currentComb, allCombs: &allCombs, maxIndex: relation.first!.count, index: 0, combSize: i)
        
        for columns in allCombs {
            if isUnique(relation: relation, columns: columns) && isMinimal(relation: relation, key: columns) {
                answer += 1
            }
        }
    }
    
    return answer
}

solution([["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]])
