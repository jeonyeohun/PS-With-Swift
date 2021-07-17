import Foundation

func getRank (matches: Int) -> Int {
    let rank = 6 - matches + 1
    return rank >= 6 ? 6 : rank;
}

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let minScore = win_nums.filter({lottos.contains($0)}).count
    let maxScore = minScore + lottos.filter({ $0 == 0 }).count
    
    return [getRank(matches: maxScore), getRank(matches: minScore)]
}