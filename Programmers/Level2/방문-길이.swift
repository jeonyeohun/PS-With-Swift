import Foundation

func solution(_ dirs:String) -> Int {
    var count = 0
    var currentRow = 0
    var currentCol = 0
    var usedEdge: Set<[Int]> = []
    
    
    for dir in dirs {
        var edge = [currentRow, currentCol]
        var isValidMove = true
        
        switch dir {
        case "U" where currentRow > -5:
            currentRow -= 1
        case "D" where currentRow < 5:
            currentRow += 1
        case "R" where currentCol < 5:
            currentCol += 1
        case "L" where currentCol > -5:
            currentCol -= 1
        default:
            isValidMove = false
        }
        
        if isValidMove {
            edge += [currentRow, currentCol]
            let turnEdge = [edge[2], edge[3], edge[0], edge[1]]
            
            if !usedEdge.contains(edge) && !usedEdge.contains(turnEdge) {
                usedEdge.insert(edge)
                usedEdge.insert(turnEdge)
                count += 1
            }
        }
    }
    return count
}