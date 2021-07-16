import Foundation

func clearStudentWithOneCloth (_ lostStudents: [Int],  _ reserveStudents: [Int]) -> ([Int], [Int]){
    let losts = lostStudents.filter({ reserveStudents.firstIndex(of: $0) == nil })
    let reserves = reserveStudents.filter({ lostStudents.firstIndex(of: $0) == nil })
    
    return (losts, reserves)
}

func borrowCloth (_ nextStudentId: Int, _ lostStudents: inout [Int], _ reserveStudents: inout [Int]) -> Bool {
    if nextStudentId >= 0, let nextStudentIdx = reserveStudents.firstIndex(of: nextStudentId) {
        reserveStudents.remove(at: nextStudentIdx)
        return true
    }
    return false
}

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var (lostStudents, reserveStudents) = clearStudentWithOneCloth(lost, reserve)
    var studentsWithCloth = n - lostStudents.count
    
    while !lostStudents.isEmpty {
        let lostStudentId = lostStudents.first!
        
        if (borrowCloth(lostStudentId - 1, &lostStudents, &reserveStudents)) {
            studentsWithCloth += 1
        } else if (borrowCloth(lostStudentId + 1, &lostStudents, &reserveStudents)) {
            studentsWithCloth += 1
        }
        lostStudents.removeFirst()
    }
    
    return studentsWithCloth
}
