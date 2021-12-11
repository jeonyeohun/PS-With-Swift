import Foundation

var cases = 0
while true {
    cases += 1
    let input = readLine()!.components(separatedBy: " ")
    if input.allSatisfy({ $0 == "0" }) { break }
    let lpv = input.map({ Int($0)! })
    let l = lpv[0]
    let p = lpv[1]
    let v = lpv[2]
    
    print("Case \(cases): \(v / p * l + min(v % p, l))")
}

