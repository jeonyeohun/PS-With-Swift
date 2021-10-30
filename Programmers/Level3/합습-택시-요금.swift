import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var dists = Array(repeating: Array(repeating: 987654321, count: n + 1), count: n + 1)
    for fare in fares {
        dists[fare[0]][fare[1]] = fare[2]
        dists[fare[1]][fare[0]] = fare[2]
    }
    for i in 0..<dists.count {
        for j in 0..<dists.count {
            if i == j { dists[i][j] = 0 }
        }
    }
    for mid in 1...n {
        for start in 1...n {
            for end in 1...n {
                dists[start][end] = min(dists[start][end], dists[start][mid] + dists[mid][end])
            }
        }
    }
    var answer = 987654321
    for mid in 1...n {
        answer = min(answer, dists[s][mid] + dists[mid][a] + dists[mid][b])
    }
    return answer
}