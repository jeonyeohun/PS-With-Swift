import Foundation

struct Point: Hashable {
    let row: Int
    let col: Int
    
    static func +(lhs: Point, rhs: Point) -> Point{
        return Point(row: lhs.row + rhs.row, col: lhs.col + rhs.col)
    }
    
    func isInRange() -> Bool {
        return col >= 0 && col < 5 && row >= 0 && row < 5
    }
}

func calcManhattanDist(from point1: Point, to point2: Point) -> Int {
    return abs(point1.row - point2.row) + abs(point1.col - point2.col)
}

func bfs(place: [[Character]], start: Point, visited: inout Set<Point>) -> Int{
    var queue: [(point: Point, accumulateDist: Int)] = []
    let nextDir = [
        Point(row: 1, col: 0),
        Point(row: 0, col: 1),
        Point(row: -1, col: 0),
        Point(row: 0, col: -1)
    ]
    
    visited.insert(start)
    queue.append((start, 0))
    
    while !queue.isEmpty {
        let now = queue.removeFirst()
        visited.insert(now.0)
        
        if place[now.point.row][now.point.col] == "P" && now.accumulateDist > 0 {
            return now.accumulateDist
        }
        
        for next in nextDir {
            let nextPoint = now.point + next
            if nextPoint.isInRange() && !visited.contains(nextPoint) && place[nextPoint.row][nextPoint.col] != "X" {
                queue.append((nextPoint, now.accumulateDist + calcManhattanDist(from: now.point, to: nextPoint)))
            }
        }
    }
    return 987654321
}

func solution(_ places:[[String]]) -> [Int] {
    let placeMaps = places.map { place in
        place.map { row in
            Array(row)
        }
    }
    
    var answer = [Int]()
    for map in placeMaps {
        answer.append(1)
        
        outer: for i in 0..<map.count {
            for j in 0..<map.count {
                if map[i][j] == "P" {
                    var visited = Set<Point>()
                    let startPoint = Point(row: i, col: j)
                    if bfs(place: map, start: startPoint, visited: &visited) <= 2 {
                        answer[answer.endIndex - 1] = 0
                        continue outer
                    }
                }
            }
        }
    }
    return answer
}




assert(solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]) == [1, 0, 1, 1, 1], "wrong answer")
print("correct answer")
