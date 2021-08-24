import Foundation

func solution(_ s:String) -> String {
    return s.components(separatedBy: " ").map({ word -> String in
        guard let initLetter = word.first else {
            return word
        }
        
        return initLetter.uppercased()
            + String(word[word.index(after: word.startIndex)...]).lowercased()
    }).joined(separator: " ")
}