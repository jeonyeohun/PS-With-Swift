import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var sortedTimeTable = timetable.map({ time -> Int in
        let splitTime = time.components(separatedBy: ":")
        let hrs = Int(splitTime[0])! * 60
        let min = Int(splitTime[1])!
        return hrs + min
    }).sorted(by: >)
    
    var lastRide = 0
    var rideCount = 0
    var leaveTime = 540
    for _ in 0..<n {
        rideCount = m
        for _ in 0..<m {
            if sortedTimeTable.isEmpty || sortedTimeTable.last! > leaveTime { break }
            lastRide = sortedTimeTable.removeLast()
            rideCount -= 1
        }
        leaveTime += t
    }
    
    leaveTime = rideCount == 0 ? lastRide - 1 : leaveTime - t
    let hr = leaveTime / 60 < 10 ? "0\(leaveTime / 60)" :"\(leaveTime / 60)"
    let min = leaveTime % 60 < 10 ? "0\(leaveTime % 60)" :"\(leaveTime % 60)"
    return hr + ":" + min
}

//solution(1, 1, 5,     ["08:00", "08:01", "08:02", "08:03"])
//solution(1,    1,    5,    ["08:00", "08:01", "08:02", "08:03"])
//print(solution(2,    10,    2,    ["09:10", "09:09", "08:00"]))
//print(solution(2,    1,    2,    ["09:00", "09:00", "09:00", "09:00"]))
//solution(1,    1,    5,    ["00:01", "00:01", "00:01", "00:01", "00:01"])
//solution(1,    1,    1,    ["23:59"])
// print(solution(10,    60,    45,    ["23:59","23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59"]))
