import Foundation

func makeComb (operators: [String], priorityOp: [String], combinations: [[String]]) -> [[String]] {
    var combinations = combinations
    var priorityOp = priorityOp
    
    if priorityOp.count == 3 {
        combinations.append(priorityOp)
        return combinations
    }
    
    for i in 0..<operators.count {
        if priorityOp.contains(operators[i]) { continue }
        priorityOp.append(operators[i])
        combinations = makeComb(operators: operators, priorityOp: priorityOp, combinations: combinations)
        priorityOp.removeLast()
    }
    return combinations
}

func stringToOperator(op: String) -> ((Int, Int)->Int) {
    switch op {
    case "+":
        return (+)
    case "-":
        return (-)
    default:
        return (*)
    }
}

func separateExpression(expression: String) -> [String] {
    let plusOps = expression.indices.filter({ expression[$0] == "+" }).map({ place in (op: "+", bit: place)})
    let minusOps = expression.indices.filter({ expression[$0] == "-" }).map({ place in (op: "-", bit: place)})
    let multOps = expression.indices.filter({ expression[$0] == "*" }).map({ place in (op: "*", bit: place)})
    let operators = plusOps + minusOps + multOps
    
    var numbers = expression.components(separatedBy: ["+", "-", "*"])
    var sortedOps = operators.sorted(by: {$0.bit < $1.bit}).map({ $0.op })
    
    var i = 1
    while !sortedOps.isEmpty {
        numbers.insert(sortedOps.removeFirst(), at: i)
        i += 2
    }
    
    return numbers
}

func solution(_ expression:String) -> Int64 {
    var answer = 0
    let operators = ["+", "-", "*"]
    let operatorCombinations = makeComb(operators: operators, priorityOp: [], combinations: [])
    let separatedExpression = separateExpression(expression: expression)
    
    for combination in operatorCombinations {
        var currentExpression = separatedExpression
        var result = 0
        for op in combination {
            var stack: [String] = []
            while !currentExpression.isEmpty {
                var next = currentExpression.removeFirst()
                if !stack.isEmpty && op == next {
                    let lhs = Int(stack.removeLast())!
                    let rhs = Int(currentExpression.removeFirst())!
                    next = String(stringToOperator(op: op)(lhs, rhs))
                }
                stack.append(next)
            }
            currentExpression = stack
            result = Int(currentExpression.last!)!
        }
        answer = max(answer, abs(result))
    }
    return Int64(answer)
}