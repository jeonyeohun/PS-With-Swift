import Foundation

func finishJob (_ progresses : inout [Int], _ speeds: inout [Int]) -> Int{
    progresses.removeFirst()
    speeds.removeFirst()
    return 1
}

func calcDaysLeft (_ progresses : inout [Int], _ speeds: inout [Int]) -> Int {
    let funcNow = progresses.first!
    let timeLeft = 100 - funcNow
    
    return Int(ceil(Double(timeLeft) / Double(speeds.first!)))
}

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progs = progresses
    var spds = speeds
    var answer : [Int] = []
    
    while(!progs.isEmpty) {
        var finishCount = 0
        print( calcDaysLeft(&progs, &spds))
        let currFuncDaysLeft = calcDaysLeft(&progs, &spds)
        finishCount += finishJob(&progs, &spds)
        
        for _ in 0..<progs.count {
            let nextFuncDaysLeft = calcDaysLeft(&progs, &spds)
            if (currFuncDaysLeft >= nextFuncDaysLeft) {
                finishCount += finishJob(&progs, &spds)
            }
        }
        answer.append(finishCount)
    }
    return answer
}