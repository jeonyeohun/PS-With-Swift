import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    func bfs() -> Int {
        var queue: [String] = [begin]
        var usedWords: Set<String> = [begin]
        var depth = 0
        while !queue.isEmpty {
            let size = queue.count
            let now = queue.removeLast()
            if now == target {
                return depth
            }
            for _ in 0..<size {
                for word in words {
                    var diffCount = 0
                    for (a, b) in zip(now, word) {
                        if a != b { diffCount += 1 }
                    }
                    if diffCount == 1 && !usedWords.contains(word){
                        queue.append(word)
                        usedWords.insert(word)
                    }
                }
            }
            depth += 1
        }
        return 0
    }
    return bfs()
}
print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))
print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log"]))
