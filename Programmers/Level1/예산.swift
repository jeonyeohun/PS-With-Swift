import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var sortedTeam = d.sorted(by: <)
    var remainBudget = budget
    var grantCount = 0
    for askedCost in sortedTeam {
        if remainBudget < askedCost {
            break
        }
        remainBudget -= askedCost
        grantCount += 1
    }
    return grantCount
}