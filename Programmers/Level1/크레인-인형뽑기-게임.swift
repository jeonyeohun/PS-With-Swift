import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var gameBoard: [[Int]] = []
    var bucket: [Int] = []
    
    for i in 0..<board[0].count {
        var stack: [Int] = []
        for j in 0..<board.count where board[j][i] > 0{
            stack.insert(board[j][i], at: 0)
        }
        gameBoard.append(stack)
    }
    
    print(gameBoard)
    
    var popCount = 0;
    for move in moves {
        let popItem: Int? = gameBoard[move - 1].popLast()
        guard popItem != nil else {
            continue;
        }
        
        if !bucket.isEmpty && popItem! == bucket.last! {
            let _ = bucket.popLast()
            popCount+=2
        } else {
            bucket.append(popItem!)
        }
    }
    return popCount
}

let res = solution([[0, 0, 0]], [1])
print(res)
