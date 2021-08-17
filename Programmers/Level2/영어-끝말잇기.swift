import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var wordSet = Set<String>()
    for (index, word) in words.enumerated() {
        if !wordSet.isEmpty && (wordSet.contains(word) || words[index-1].last != word.first){
            return [index % n + 1, index / n + 1]
        }
        wordSet.insert(word)
    }
    
    return [0, 0]
}