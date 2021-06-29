import Foundation

let positionCoordinate = [
        1: (y: 0, x: 0), 2: (y: 0, x: 1), 3: (y: 0, x: 2),
        4: (y: 1, x: 0), 5: (y: 1, x: 1), 6: (y: 1, x: 2),
        7: (y: 2, x: 0), 8: (y: 2, x: 1), 9: (y: 2, x: 2),
        10: (y: 3, x: 0), 0: (y: 3, x: 1), 11: (y: 3, x: 2),
    ]

func calcDist(_ current: (y: Int, x: Int), _ target: (y: Int, x: Int)) -> Int {
    let MoveCountY = abs(current.y - target.y)
    let MoveCountX = abs(current.x - target.x)
    
    return MoveCountY + MoveCountX
}

func isLeftHandTarget(target: (Int, Int)) -> Bool {
    return target == positionCoordinate[1]!
        || target == positionCoordinate[4]!
        || target == positionCoordinate[7]!
}

func isRightHandTarget(target: (Int, Int)) -> Bool {
    return target == positionCoordinate[3]!
        || target == positionCoordinate[6]!
        || target == positionCoordinate[9]!
}

func moveRightHand(_ answer: inout String, _ rightCurrentPosition: inout  (y: Int, x: Int), _ nextPosition: (y: Int, x: Int)){
    answer.append("R")
    rightCurrentPosition = nextPosition
}

func moveLeftHand(_ answer: inout String, _ leftCurrentPosition: inout  (y: Int, x: Int), _ nextPosition: (y: Int, x: Int)){
    answer.append("L")
    leftCurrentPosition = nextPosition
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    var answer = ""
    var leftCurrentPosition: (y: Int, x: Int) = positionCoordinate[10]!
    var rightCurrentPosition: (y: Int, x: Int) = positionCoordinate[11]!
    
    for currentTarget in numbers {
        let nextPosition = positionCoordinate[currentTarget]!
        
        if isLeftHandTarget(target: nextPosition) {
            moveLeftHand(&answer, &leftCurrentPosition, nextPosition)
        } else if isRightHandTarget(target: nextPosition) {
            moveRightHand(&answer, &rightCurrentPosition, nextPosition)
        } else {
            let distFromLeft = calcDist(leftCurrentPosition, nextPosition)
            let distFromRight = calcDist(rightCurrentPosition, nextPosition)

            if distFromLeft < distFromRight {
                moveLeftHand(&answer, &leftCurrentPosition, nextPosition)
            } else if (distFromLeft > distFromRight) {
                moveRightHand(&answer, &rightCurrentPosition, nextPosition)
            } else if hand == "left" {
                moveLeftHand(&answer, &leftCurrentPosition, nextPosition)
            } else if hand == "right" {
                moveRightHand(&answer, &rightCurrentPosition, nextPosition)
            }
        }
    }
    return answer
}