import Foundation

func generateComb (order: [Character], combs: inout [String], combString: inout String, stringSize: Int, index: Int){
    if combString.count == stringSize {
        combs.append(combString)
        return
    }
    for index in index..<order.count {
        combString.append(order[index])
        generateComb(order: order, combs: &combs, combString: &combString, stringSize: stringSize, index: index + 1)
        combString.removeLast()
    }
}

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    // 주문을 알파벳 순서로 정렬
    let orders = orders.map({ $0.sorted() })
    var answer : Set<String> = []
    var orderCombinations: [String] = []
    
    // course 개수 만큼 뽑아서 만들 수 있는 중복없는 조합 생성. 각 주문마다 만들 수 있는 조합들으 배열에 담는다.
    for order in orders {
        for i in course {
            var combs: [String] = []
            var initialString: String = ""
            generateComb(order: Array(order), combs: &combs, combString: &initialString, stringSize: i, index: 0)
            orderCombinations += combs
        }
    }
    
    // 각 주문의 조합배열에서 N개 크기의 조합들을 골라내서 몇번 나왔는지 세어준다.
    for num in course {
        var combCounts: [String : Int] = [:]
        let numCombs = orderCombinations.filter({ $0.count == num })
        // 모든 조합의 등장횟수 계산
        for comb in numCombs {
            combCounts[comb] = numCombs.filter({ $0 == comb }).count
        }
        
        // 조합들 중 가장 큰 등장 횟수 찾기
        let maxCount = combCounts.values.max()
        if maxCount == 1 { continue }
        
        // 가장 큰 등장 횟수만큼 나온 주문조합을 골라내서 정답배열에 넣는다.
        combCounts.keys.filter({ combCounts[$0] == maxCount }).forEach({
            answer.insert($0)
        })
    }
    
    // 정답배열을 정렬해서 반환
    return Array(answer.sorted())
}

print(solution(["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"], [2,3,5]))
print(solution(["XYZ", "XWY", "WXA"], [2,3,4]))
