import Foundation

func solution(_ enroll:[String], _ referral:[String], _ seller:[String], _ amount:[Int]) -> [Int] {
    var edges: [String: String] = [:]
    var profits: [String: Int] = ["-" : 0]
    let amount = amount.map({ $0 * 100 })
    
    for (parent, child) in zip(referral, enroll) {
        edges[child] = parent
    }
    for enroll in enroll {
        profits[enroll] = 0
    }
    
    func dfs(next: String, amount: Int) {
        if amount < 1 { return }
        profits[next]! += amount - Int(Double(amount) * 0.10)
        if edges[next] != nil {
            dfs(next: edges[next]!, amount: Int(Double(amount) * 0.10))
        }
    }
    for (seller, amount) in zip(seller, amount) {
        dfs(next: seller, amount: amount)
    }
    return enroll.map({ profits[$0]! })
}
