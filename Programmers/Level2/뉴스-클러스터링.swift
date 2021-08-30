import Foundation

func intersect(set1:[String], set2:[String]) -> [String] {
    var intersect: [String] = []
    (set1+set2).forEach({ num in
        if intersect.contains(num) { return }
        
        let subset1 = set1.filter({ $0 == num })
        let subset2 = set2.filter({ $0 == num })
        
        intersect += subset1.count < subset2.count ? subset1 : subset2
    })
    
    return intersect
}

func union(set1:[String], set2:[String]) -> [String] {
    var union: [String] = []
    (set1+set2).forEach({ num in
        if union.contains(num) { return }
        
        let subset1 = set1.filter({ $0 == num })
        let subset2 = set2.filter({ $0 == num })
        
        union += subset1.count > subset2.count ? subset1 : subset2
    })
    
    return union
}

func findSubset(str: String) -> [String] {
    var strSubset:[String] = []
    for i in 0..<(str.count - 1) {
        let subset = String(Array(str)[i...i+1])
        
        if subset.allSatisfy({ $0.isLetter }) {
            strSubset.append(subset.uppercased())
        }
    }
    return strSubset
}

func solution(_ str1:String, _ str2:String) -> Int {
    let str1Subset:[String] = findSubset(str: str1)
    let str2Subset:[String] = findSubset(str: str2)
    
    let simScore = str2Subset.isEmpty && str1Subset.isEmpty ? 1 : Double(intersect(set1: str1Subset, set2: str2Subset).count) / Double(union(set1: str1Subset, set2: str2Subset).count)

    return Int(simScore * 65536)
}

solution("FRANCE", "french")
solution("handshake", "shake hands")
solution("aa1+aa2", "AAAA12")
solution("E=M*C^2", "e=m*c^2")
solution("aaabb", "aabbb")
